class Public::RoomsController < ApplicationController

before_action :authenticate_user!

def create
  @room = Room.create
  @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
  @entry2 = Entry.create(entry_params)
  redirect_to room_path(@room.id)
end

def show
  @room = Room.find(params[:id])
  @room.check_messages_notification(current_user)
  if Entry.where(user_id: current_user.id, room_id: @room.id).present?
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  else
    redirect_back(fallback_location: root_path)
  end 
end



private
  
def entry_params
  params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
end

 
end
