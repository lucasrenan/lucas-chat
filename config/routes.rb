Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get 'chat' => 'rooms#index'

  root 'users#new'
end
