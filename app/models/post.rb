class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true
  
  validate :image_type

private

def image_type
  if !image.blob.content_type.in?(%('image/jpeg image/png'))
    image.purge 
    errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
  end
end
end
