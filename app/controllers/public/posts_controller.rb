class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] ="だげほー"
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def index 
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
