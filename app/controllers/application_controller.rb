class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :breadcrumb_url

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end

  def breadcrumb_url
    request.env["HTTP_REFERER"]
  end
end
