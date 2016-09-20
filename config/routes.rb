Rails.application.routes.draw do
  resources :profiles, only: [:edit, :update]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index' 
  #get 'pages/index'

  get 'pages/about_us'

  get 'pages/faq'

  get 'pages/tos'

  get 'pages/contact_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
