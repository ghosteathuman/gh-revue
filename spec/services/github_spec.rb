require "rails_helper"

RSpec.describe Github do
  describe "identity_request_url" do
    let(:client_id) { Faker::Alphanumeric.alphanumeric(number: 20) }

    it "returns the identity request url" do
      stub_request(:get,
        "https://github.com/login/oauth/authorize?client_id=#{client_id}&redirect_uri=localhost/callback&scope=repo")
        .with(
          headers: {
            "Content-Type" => "application/json"
          }
        )
        .to_return(status: 200,
                   body: "<html><body>You are being <a href=\"https://github.com/login?client_id=#{client_id}&amp;"\
                     "return_to=%2Flogin%2Foauth%2Fauthorize%3Fclient_id%3D#{client_id}"\
                     "%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A3000%252Fcallback%26scope%3Drepo\">"\
                     "redirected</a>.</body></html>", headers: {})

      expect(Rails.application.credentials).to receive(:github)
        .and_return(JSON.parse({client_id: client_id}.to_json, object_class: OpenStruct))
      expect(Github.new.identity_request_url("localhost"))
        .to eq "https://github.com/login?client_id=#{client_id}&return_to=%2Flogin%2Foauth%2Fauthorize%3"\
          "Fclient_id%3D#{client_id}%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A3000%252Fcallback"\
          "%26scope%3Drepo"
      expect(WebMock).to have_requested(:get,
        "https://github.com/login/oauth/authorize?client_id=#{client_id}&redirect_uri=localhost/callback&scope=repo").once
    end
  end

  describe "get_access_token" do
    let(:client_id) { Faker::Alphanumeric.alphanumeric(number: 20) }
    let(:client_secret) { Faker::Alphanumeric.alphanumeric(number: 40) }
    let(:code) { Faker::Alphanumeric.alphanumeric(number: 20) }
    let(:access_token) { Faker::Alphanumeric.alphanumeric(number: 40) }
    let(:login) { Faker::Internet.username }

    it "gets and store access token" do
      stub_request(:post,
        "https://github.com/login/oauth/access_token")
        .with(
          headers: {
            "Content-Type" => "application/json",
            "Accept" => "application/json"
          },
          body: "{\"client_id\":\"#{client_id}\",\"client_secret\":\"#{client_secret}\",\"code\":\"#{code}\"}"
        )
        .to_return(status: 200,
                   body: "{\"access_token\":\"#{access_token}\",\"token_type\":\"bearer\",\"scope\":\"repo\"}",
                   headers: {})

      stub_request(:post, "https://api.github.com/graphql")
        .with(
          body: "{\"query\":\"query { viewer { login } }\"}",
          headers: {
            "Authorization" => "bearer #{access_token}",
            "Content-Type" => "application/json"
          }
        )
        .to_return(status: 200, body: "{\"data\":{\"viewer\":{\"login\":\"#{login}\"}}}", headers: {})

      expect(Rails.application.credentials).to receive(:github).twice
        .and_return(
          JSON.parse({client_id: client_id.to_s,
                      client_secret: client_secret.to_s}.to_json,
            object_class: OpenStruct)
        )

      Github.new.store_access_token(code)

      viewer = Kredis.json login.to_s

      expect(viewer.value).to eq({"user" => login, "access_token" => access_token})
      expect(WebMock).to have_requested(:post,
        "https://github.com/login/oauth/access_token").once
      expect(WebMock).to have_requested(:post,
        "https://api.github.com/graphql").once
    end
  end
end
