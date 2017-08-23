class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in? 
  helper_method :current_user
  helper_method :set_return_to

  # checks to see if the user is logged in with a valid account
  def logged_in?
    !session[:user_id].nil? and User.find_by(id: session[:user_id])
  end

  # returns the current user if it exists
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_return_to
    session[:return_to] = request.url
  end
end
  