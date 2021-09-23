class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries, source: :user

  def check_messages_notification(current_user)
    unchecked_messages = messages.includes(:user).where(checked: false).where.not(user_id: current_user.id)
    unchecked_messages&.each { |unchecked_message| unchecked_message.update(checked: true) }
  end
  
  
end
