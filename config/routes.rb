Rails.application.routes.draw do
  root to: 'home#show', controller: 'home'

  resource :home, only: [:show]
  resources :image_examples, only: [:create]
end
