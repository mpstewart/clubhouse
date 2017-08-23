class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all.order("created_at").limit(25)
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "Post successful"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def require_login
      unless logged_in?
        set_return_to
        flash.now[:error] = "You must be logged in to create a new post"
        render 'logins/new'
      end
    end
end