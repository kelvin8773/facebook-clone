Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'signup', sign_up: 'cmon_let_me_in' }

  resource :posts
end
