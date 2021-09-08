class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true

  validate :image_type


  # ---------- アソシエーション---------
  has_many :comments, dependent: :destroy
  
  
  
  # ---------- いいね---------
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    
  
   # ---------- いいね---------
  # ---------- アソシエーション---------

private

def image_type
  if !image.blob.content_type.in?(%('image/jpeg image/png'))
    image.purge
    errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
  end
end
end
