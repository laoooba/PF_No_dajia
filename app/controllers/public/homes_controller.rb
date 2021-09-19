class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @tags = Tag.all
    @posts = Post.all.order(created_at: :desc).limit(4)
  end
end
