Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    collection do
      get "/get_list_products", to: 'user#get_list_products'
    end
  end
  root "user#index"

  resources :products, only: [:create]
  resources :stores, only: [:create]
end
