class Genre < ApplicationRecord

  has_many :genre_relations #中間テーブルのアソシエーション
  has_many :posts, through: :genre_relations #中間テーブルを通じたpostモデルとのアソシエーション

end
