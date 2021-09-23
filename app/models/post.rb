class Post < ApplicationRecord
  has_one_attached :image

  enum status: { 有効: 0, 編集待ち: 1, 結果待ち: 2}

  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true
  validates :tag_ids, presence: true



  # ---------- アソシエーション---------
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, source: :tag

  def post_tags
    tags.map {|tag| tag.title}
  end

  # ---------- いいね---------
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # ---------- いいね---------
  
  # ----------通知機能---------
  has_many :notifications, dependent: :destroy
  
  def create_notification_favorite(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ?", current_user.id, user_id, id, 'favorite' ]) 
    
    if temp.blank?
      notification = current_user.notifications.new(post_id: id, visited_id: user_id, action: 'favorite')
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end 
      notification.save if notification.valid?
    end 
  end
  
  def create_notification_comment(current_user, comment_id)

    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do  |temp_id|
      save_notification_comment(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment(current_user, comment_id, visited_id)

    notification = current_user.notifications.new(post_id: id, comment_id: comment_id, visited_id: visited_id, action: 'comment')
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
    
  # ----------通知機能---------
  
  
  # ---------- アソシエーション---------

end
