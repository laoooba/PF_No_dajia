class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="だげほー"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end 
  
  def unsubscribe
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会しました"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :description, company_user_attributes: [:phone_number, :company_url], student_user_attributes: [:school_name, :major])
  end
  
end
