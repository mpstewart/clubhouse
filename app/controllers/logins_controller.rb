class LoginsController < ApplicationController
  include LoginsHelper

  def new
  end

  def create
    @user = User.find_by(username: params[:login][:username])

    # if a user is found and they've provided valid authentication
    if @user && @user.authenticate(params[:login][:password])
      log_in @user

      # redirect to a referring site if one is present
      redirect_to session.delete(:return_to) and return if session[:return_to] 

      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password"
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_path
  end
end
