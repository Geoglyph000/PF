Rails.application.routes.draw do

  devise_for :admins, module: "admin/devise"

  devise_for :users, module: "public/devise"

  root to: 'homes#top'

  #管理者
  namespace :admin do
    resources :admins, only: [:show, :edit, :update]
    resources :users
    resources :posts
    resources :genres
  end

  #エンドユーザ
  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    put "/users/:id/deactivate" => "users#deactivate", as: 'users_deactivate' #論理退会処理
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
    get 'users/:id/favorites' => 'favorites#show', as: 'favorite' #いいね一覧
    get 'posts/date/:date' => 'posts#date_index', as: 'date_index' #日別投稿一覧
  end

  get 'posts/genre/:genre_id' => 'genre_relations#index', as: 'genre_index' #日別投稿一覧

end
