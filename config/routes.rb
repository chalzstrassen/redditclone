Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :destroy]
end
