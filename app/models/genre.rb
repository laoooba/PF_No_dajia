class Genre < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  has_many :posts, dependent: :destroy
end
