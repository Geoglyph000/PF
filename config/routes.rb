Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root to: 'homes#top'

  namespace :admin do
  end

end
