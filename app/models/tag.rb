class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :posts, through: :tag_maps, source: :post
  
  validates :title, presence: true
end
