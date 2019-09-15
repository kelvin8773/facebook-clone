Rails.application.routes.draw do
  get 'home' => 'home#index'
  root to: 'home#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'signup', sign_up: 'new' }

  resource :posts
end
