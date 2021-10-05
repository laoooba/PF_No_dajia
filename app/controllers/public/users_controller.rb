class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes([:profile_image_attachment, :student_user, :company_user]).order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites.order(created_at: :desc).page(params[:page]).per(8)
    @posts = @user.posts.includes([:image_attachment, :genre]).order(created_at: :desc).page(params[:page]).per(6)
    @edit_posts = @user.posts.where.not(status: "有効").order(created_at: :desc).page(params[:page]).per(6)
    # ------------------DM機能------------------
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
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
    # ------------------DM機能------------------
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "だげほー"
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
    flash[:primary] = "Thank you for using"
    redirect_to root_path
  end

  def dms
    @user = User.find(params[:id])
    @rooms = @user.rooms.includes([:entries,:users]).order(created_at: :desc).page(params[:page]).per(9)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :description, :profile_image, company_user_attributes: [:phone_number, :company_url], student_user_attributes: [:school_name, :major])
  end
end
