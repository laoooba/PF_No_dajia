class Genre < ApplicationRecord
  has_many :osts, dependent: :destroy
  validates :title, presence: true
end
