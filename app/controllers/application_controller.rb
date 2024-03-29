class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  # accepts these methods in the view
  helper_method :current_user, :logged_in?

  def current_user
    # find user with the session
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end
end
