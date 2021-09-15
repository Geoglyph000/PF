class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def deactivate
    @user = User.find(params[:id])
    @user.update(is_active: false) #退会フラグを立てる
    reset_session #ログアウトさせる
    redirect_to root_path #ホームにリダイレクト
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end


end
