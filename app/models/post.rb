class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true


  # ---------- アソシエーション---------
  has_many :comments, dependent: :destroy
  
  
  
  # ---------- いいね---------
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
   # ---------- いいね---------
  # ---------- アソシエーション---------

end
