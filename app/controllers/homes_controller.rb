class HomesController < ApplicationController

  def home
    @genres =Genre.all
  end

  def top
    if user_signed_in?
      redirect_to root_path
    end
  end

end
