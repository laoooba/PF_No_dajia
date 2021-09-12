class Post < ApplicationRecord
  has_one_attached :image

  enum status: { 有効: 0, 編集待ち: 1, 結果待ち: 2}

  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true
  validates :tag_ids, presence: true



  # ---------- アソシエーション---------
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, source: :tag

  def post_tags
    tags.map {|tag| tag.title}
  end

  # ---------- いいね---------
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

   # ---------- いいね---------
  # ---------- アソシエーション---------

end
