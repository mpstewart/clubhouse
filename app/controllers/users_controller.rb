class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome"
      redirect_to root_path
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
end
