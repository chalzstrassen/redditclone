Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :subs, except: [:destroy] do
    resources :posts, only: [:edit, :update]
  end

  resources :posts, except: [:index, :destroy, :edit, :update]
end
