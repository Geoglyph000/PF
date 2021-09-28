class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_many :genre_relations #中間テーブルのアソシエーション
  has_many :genres, through: :genre_relations #中間テーブルを通じたgenreモデルとのアソシエーション

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :date, presence: true

end
