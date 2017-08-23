class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in? 
  helper_method :current_user

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
