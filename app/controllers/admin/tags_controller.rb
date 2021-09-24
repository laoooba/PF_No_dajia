class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "ジャンルを追加しました"
    else
      @tag = Tag.new
      @tags = Tag.all
      flash.now[:alert] = "ジャンルの追加に失敗しました"
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "変更を保存しました"
    else
      flash.now[:alert] = "変更の保存に失敗しました"
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
