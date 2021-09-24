class GenreRelationsController < ApplicationController

  def index
    @genre = Genre.find(params[:genre_id]) #パラメータからジャンルを取得
    @posts = @genre.posts #取得したジャンルの投稿を取得
  end

end
