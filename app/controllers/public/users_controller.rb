class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :description, company_user_attributes: [:phone_number, :company_url], student_user_attributes: [:school_name, :major])
  end
  
end
