class GithubController < ApplicationController

  def user_identity
    redirect_to Github.new.identity_request_url(request.base_url)
  end

  def callback
    Github.new.get_access_token(params[:code])
  end
end
