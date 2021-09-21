class Admin::UsersController < ApplicationController
  before_action :authenticate_admin! #管理者ログインしていないアクセスを弾く

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy #物理削除
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def deactivate #論理削除
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @user.update(is_active: false) #退会フラグを立てる
    @posts.update(is_private: true) #投稿を全て非公開にする
    reset_session #ログアウトさせる
    redirect_to root_path #ホームにリダイレクト
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :introduction, :profile_image, :is_active)
    end

end
