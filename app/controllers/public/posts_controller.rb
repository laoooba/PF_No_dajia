class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @post.tag_maps.new
    if current_user.student_user
      @genres = Genre.where.not(id: 1)
    else
      @genres = Genre.all
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] ="だげほー"
      redirect_to post_path(@post)
    else
    if current_user.student_user
      @genres = Genre.where.not(id: 1)
    else
      @genres = Genre.all
    end
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per(8)
  end


  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.status == "編集待ち"
      @post.status = "結果待ち"
      if @post.update(post_params)
        flash[:notice]="だげほー"
        redirect_to post_path(@post)
      else
        render :edit
      end
    else
      if @post.update(post_params)
        flash[:notice]="だげほー"
        redirect_to post_path(@post)
      else
        render :edit
      end
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :status, :status_content, :user_id, :genre_id, { tag_ids: [] })
  end
end
