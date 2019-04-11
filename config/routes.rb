Rails.application.routes.draw do
  get 'user/show'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' } # ここを変更
  root to: 'static_pages#home'  
  get '/about', to: 'static_pages#about'
  get '/serch',  to:'static_pages#serch'
  get '/contact', to:'static_pages#contact'
  resources :users
end
