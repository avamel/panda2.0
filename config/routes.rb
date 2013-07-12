Panda20::Application.routes.draw do

  resources :tours, only: [:index, :show] do
  end

  resources :visas, only: [:index, :show] do
  end

  resources :travels, only: [:index, :show] do
  end

  resources :countries, only: [:index, :show] do
  end

  resources :news, only: [:index, :show] do
  end

  get 'contacts', to: 'contacts#index'

  get "home/index"
  root "home#index"
end
