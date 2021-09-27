class HomesController < ApplicationController

  def home
    @genres =Genre.all
  end

  def landing #ランディングページ
    if user_signed_in?
      redirect_to home_path #ログイン時はルートパスへリダイレクト
    end
  end

end
