class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "編集しました"
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  private
  def user_params
     params.require(:user).permit(:name, :email, :description, :profile_image, :is_deleted, company_user_attributes: [:phone_number, :company_url], student_user_attributes: [:school_name, :major])
  end

end
