class Public::FavoritesController < ApplicationController
  before_action :authenticate_user! #未ログインユーザのアクセスを弾く

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    favorites = Favorite.where(user_id: params[:id]).pluck(:post_id)  # ユーザーのお気に入りのpost_idカラムを取得
    @favorites = Post.find(favorites) # postsテーブルから、お気に入り登録済みのレコードを取得
  end

end
