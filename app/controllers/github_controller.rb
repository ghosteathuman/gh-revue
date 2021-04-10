class GithubController < ApplicationController
  def index
    if session[:user_login].present?
      @pull_requests = GithubService.new.get_pull_requests(session[:user_login])
    else
      redirect_to GithubService.new.identity_request_url(request.base_url)
    end
  end

  def callback
    session[:user_login] = GithubService.new.store_access_token(params[:code])

    redirect_to "/"
  end
end
