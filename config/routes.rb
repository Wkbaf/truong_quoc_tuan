Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homepage, only: [:index] do
    collection do
      get "/get_list_products", to: 'homepage#get_list_products'
    end
  end
  root "homepage#index"

  resources :products
  resources :stores do
    collection do
      get "/get_list_stores", to: 'stores#get_list_stores'
    end
  end
end
