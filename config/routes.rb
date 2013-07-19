Panda20::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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

  resources :type_of_holidays, only: :show do
  end

  get 'contacts', to: 'contacts#index'

  get "home/index"
  root "home#index"
  get '/search', to: 'search#search', as: 'search'
end
