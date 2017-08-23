class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome"
      redirect_to root_path
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order("created_at").limit(10)
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation) 
    end

    def require_login
      unless logged_in?
        set_return_to
        flash.now[:error] = "You must be logged in to view user profiles"
        render 'logins/new'
      end
    end
end
