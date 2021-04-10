require "rails_helper"

RSpec.describe GithubController, type: :controller do
  describe "GET index" do
    let(:client_id) { Faker::Alphanumeric.alphanumeric(number: 20) }
    let(:github_service) { instance_double(GithubService) }
    let(:login) { Faker::Internet.username }
    let(:redirect_url) {
      "https://github.com/login?client_id=#{client_id}&return_to=%2Flogin%2Foauth%2Fauthorize%3"\
          "Fclient_id%3D#{client_id}%26redirect_uri%3Dhttp%253A%252F%252Flocalhost%253A3000%252Fcallback"\
          "%26scope%3Drepo"
    }

    it "gets pull requests when user_login session exists" do
      expect(GithubService).to receive(:new).and_return(github_service)
      expect(github_service).to receive(:get_pull_requests).with(login).and_return({})

      get :index, session: {user_login: login}

      expect(response).to have_http_status(:ok)
    end

    it "will redirect when no user_login session exists" do
      expect(GithubService).to receive(:new).and_return(github_service)
      expect(github_service).to receive(:identity_request_url).and_return(redirect_url)

      get :index
      expect(response).to redirect_to(redirect_url)
    end
  end

  describe "GET callback" do
    let(:code) { Faker::Alphanumeric.alphanumeric(number: 20) }
    let(:github_service) { instance_double(GithubService) }

    it "gets access token and redirects to index page" do
      expect(GithubService).to receive(:new).and_return(github_service)
      expect(github_service).to receive(:store_access_token).with(code).and_return({})

      get :callback, params: {code: code}
      expect(response).to redirect_to("/")
    end
  end
end
