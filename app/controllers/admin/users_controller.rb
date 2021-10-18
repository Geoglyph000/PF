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
      if !@user.is_active #ユーザを論理削除した際に
        @user.posts.all.update(is_private: true) #ユーザの投稿を全て非公開に
      end
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy #ユーザの物理削除
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:user_name, :introduction, :profile_image, :is_active)
    end

end
