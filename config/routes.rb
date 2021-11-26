Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  #フォロー機能のルーティング
  resources :users do
  resource :relationships, only: [:create, :destroy]
  get :followings, on: :member#今回はIDを持つように設定してます！
  get :followers, on: :member
  end

  root to: 'homes#top'

  resources :reptiles do
   resources :reptile_comments, only: [:create, :destroy]
   resource :favorites

 end
  resources :users
  get '/search', to: 'searchs#search'
end
