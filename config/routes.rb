Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products,  except: [:show]
  resources :favorites, only: [:index, :create, :destroy]
end

