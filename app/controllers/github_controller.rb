class GithubController < ApplicationController
  ENDPOINT = URI.parse("https://api.github.com")

  def get_user_identity
    client_id = Rails.application.credentials.github[:client_id]
    # url = URI.parse("https://github.com/login/oauth/authorize")

    puts Net::HTTP.get(
      URI("https://github.com/login/oauth/authorize?client_id=#{client_id}&scope=repo&redirect_uri=#{request.base_url}"),
      {"Content-Type" => "application/json"}
    )

    # Net::HTTP.get(url, {
    #   "client_id" => client_id, "scope" => "repo", "redirect_uri" => request.base_url
    # }.to_json,
    #   "Content-Type" => "application/json")
  end
end
