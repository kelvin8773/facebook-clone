Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for  :users

  resource :posts
end
