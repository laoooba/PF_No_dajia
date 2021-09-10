class Genre < ApplicationRecord
  has_many :Posts, dependent: :destroy
  validates :title, presence: true
end
