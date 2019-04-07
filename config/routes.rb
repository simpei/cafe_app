Rails.application.routes.draw do
  root 'static_pages#home'  
  get '/about', to: 'static_pages#about'
  get '/serch',  to:'static_pages#serch'
  get '/contact', to:'static_pages#contact'
end
