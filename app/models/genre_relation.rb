class GenreRelation < ApplicationRecord

  belongs_to :genre
  belongs_to :post

end
