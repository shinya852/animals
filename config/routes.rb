Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :reptiles do
   resources :reptile_comments, only: [:create, :destroy]
   resource :favorites
 end
  resources :users
end
