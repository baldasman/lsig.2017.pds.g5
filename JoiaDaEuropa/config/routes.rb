Rails.application.routes.draw do

  get 'client_area/index'

  get 'client_area/new_order'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/profile/index'
  get '/home/index'
  get 'client_area/save_order'
  post 'client_area/save_order'
  root to: 'client_area#index'
end
