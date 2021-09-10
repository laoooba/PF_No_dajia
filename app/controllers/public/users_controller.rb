class Public::UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.page(params[:page]).per(6)
  end


  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    # ------------------DM機能------------------
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry =Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cue|
        @userEntry.each do |ue|
          if cue.room_id == ue.room_id
            @isRoom = true
            @roomID = cue.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
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
  
  def dms
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :description, :profile_image, company_user_attributes: [:phone_number, :company_url], student_user_attributes: [:school_name, :major])
  end

end
