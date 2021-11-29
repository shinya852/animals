Rails.application.routes.draw do

  get 'users/show'
  get "/home/about" => "homes#about"
  devise_for :users

  #フォロー機能のルーティング
  resources :users do
   resource :relationships, only: [:create, :destroy]#今回は作成と解除のみ
    get :following, on: :member#フォローしてる人の表示
    get :followers, on: :member#フォローしてる人の表示
  end


  root to: 'homes#top'

  resources :reptiles do
   resources :reptile_comments, only: [:create, :destroy]
   resource :favorites

 end
  resources :users
  get '/search', to: 'searchs#search'
end
