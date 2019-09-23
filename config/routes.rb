Rails.application.routes.draw do
  root to: 'home#index'
  
  post 'comments/create'
  get 'comments/show'
  get 'comments/edit'
  post 'comments/update'
  delete "/delete_comment", to: "comments#destroy"

  get 'users/index'
  get 'home' => 'home#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'signup', sign_up: 'new' }

  delete "/delete_post", to: "posts#destroy"

  resource :posts
  resource :comments
  resource :likes
  resources :users, only: [:index]
end
