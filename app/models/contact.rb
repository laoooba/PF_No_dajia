class Contact < ApplicationRecord
  validates :name, :email, :title, :body, presence: true
end
