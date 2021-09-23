class Public::TagsController < ApplicationController
   before_action :authenticate_user!

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(8)
  end
end
