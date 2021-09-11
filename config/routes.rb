Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root to: 'homes#top'

  namespace :admin do
    resources :admins, only: [:show, :edit, :update]
    resources :users, except: [:destroy]
    resources :posts
    resources :genres
  end

  #エンドユーザ
  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    resources :posts
    get 'posts/date/:date' => 'posts#date_index'
  end

end
