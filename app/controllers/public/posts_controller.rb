class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @genres = Genre.all
    @tags = Tag.all
    @post.tag_maps.build
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
    @posts = Post.page(params[:page]).per(2)
  end
  
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    @tags = Tag.all
  
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]="だげほー"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, :genre_id, { tag_ids: [] }).merge(user_id: current_user.id)
  end
end
