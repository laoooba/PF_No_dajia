class Public::GenresController < ApplicationController
  before_action :authenticate_user!

  def show
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page]).per(8)
  end
end
