class LoginsController < ApplicationController
  include LoginsHelper

  def new
  end

  def create
    @user = User.find_by(username: params[:login][:username])

    if @user && @user.authenticate(params[:login][:password])
      log_in @user

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
