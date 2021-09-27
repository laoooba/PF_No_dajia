class Public::HomesController < ApplicationController
  def top
    @genres = Genre.includes([:image_attachment])
    @genres = Genre.with_attached_image
    @tags = Tag.all
    @posts = Post.includes([:image_attachment]).order(created_at: :desc)
    @posts = Post.with_attached_image
  end
end
