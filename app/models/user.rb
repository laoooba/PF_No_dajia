class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
  
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  
  enum status: { 学生: 0, 企業: 1 }
  
  has_one :company_user, inverse_of: :user
  accepts_nested_attributes_for :company_user
end
