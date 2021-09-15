class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    if @user.is_active == false
      respond_to do |format|
        format.html { redirect_to root_path, notice: '退会済みのユーザーです' }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def deactivate #退会処理
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @user.update(is_active: false) #退会フラグを立てる
    @posts.update(is_private: true) #投稿を全て非公開にする
    reset_session #ログアウトさせる
    redirect_to root_path #ホームにリダイレクト
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end


end
