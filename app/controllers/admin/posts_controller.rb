class Admin::PostsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post)
  end
  
  def wait_edit
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:status, :status_content)
  end


end
