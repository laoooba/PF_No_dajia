class Public::MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
    end
    @room = Room.find(params[:message][:room_id])
    @messages = @room.messages.includes([:user])
    @message = Message.new
    render template: "public/rooms/index"
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id, :checke).merge(user_id: current_user.id)
  end
end
