class Public::GenresController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page]).per(9)
  end
end
