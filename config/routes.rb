Rails.application.routes.draw do
  devise_for :users

  authenticate :user, ->(user) { user.admin? } do
    ActiveAdmin.routes(self)
  end

  root to: 'home#show', controller: 'home'

  resource :home, only: [:show]
  resource :guests, only: [:create]
  resources :image_examples, only: [:create]

  namespace :api do
    namespace :v1 do
      get 'is_signed_in', to: 'auth#is_signed_in?'
    end
  end
end
