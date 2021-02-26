class GithubController < ApplicationController
  GRAPHQL_URL = URI("https://api.github.com/graphql")

  def user_identity
    client_id = Rails.application.credentials.github[:client_id]

    return_html = Net::HTTP.get(
      URI("https://github.com/login/oauth/authorize?client_id=#{client_id}&scope=repo&redirect_uri=#{request.base_url}/callback"),
      {"Content-Type" => "application/json"}
    )

    redirect_url = Nokogiri::HTML.parse(return_html).at_css("a")[:href]

    redirect_to redirect_url
  end

  def callback
    url = URI("https://github.com/login/oauth/access_token")
    client_id = Rails.application.credentials.github[:client_id]
    client_secret = Rails.application.credentials.github[:client_secret]

    response = Net::HTTP.post(url, {
      "client_id" => client_id, "client_secret" => client_secret, "code" => params[:code]
    }.to_json,
      "Content-Type" => "application/json", "Accept" => "application/json")
    response_body = JSON.parse(response.body)
    access_token = response_body["access_token"]

    graphql_response =  Net::HTTP.post(GRAPHQL_URL, {
      "query" => "query { viewer { login } }"
      # query: 'query { repository(owner: "k0kubun", name: "hamlit") { nameWithOwner } }'
    }.to_json,
      "Content-Type" => "application/json", "Authorization" => "bearer #{access_token}")

    user_login = JSON.parse(graphql_response.body)["data"]["viewer"]["login"]

  end
end
