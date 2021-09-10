class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }

# ---------- ユーザーテーブルにネスト---------
  has_one :company_user, inverse_of: :user
  accepts_nested_attributes_for :company_user, update_only: true

  has_one :student_user, inverse_of: :user
  accepts_nested_attributes_for :student_user, update_only: true
  # ---------- ユーザーテーブルにネスト---------

  # ---------- アソシエーション---------
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # ---------- follow機能---------
  has_many :reverce_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :reverce_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end
  # ---------- follow機能---------
  
  # ---------- DM機能---------
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, source: :room

  # ---------- DM機能---------
  # ---------- アソシエーション---------



end
