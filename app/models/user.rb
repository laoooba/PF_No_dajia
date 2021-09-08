class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
  
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  
# ---------- ユーザーテーブルにネスト--------- 
  has_one :company_user, inverse_of: :user
  accepts_nested_attributes_for :company_user, update_only: true
  
  has_one :student_user, inverse_of: :user
  accepts_nested_attributes_for :student_user, update_only: true
  # ---------- ユーザーテーブルにネスト--------- 
  
  # ---------- アソシエーション--------- 
  has_many :books, dependent: :destroy
  
  # ---------- アソシエーション--------- 
  
  
  
end
