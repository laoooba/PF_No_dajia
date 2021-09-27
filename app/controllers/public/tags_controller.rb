class Public::TagsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(9)
  end
end
