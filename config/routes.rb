Rails.application.routes.draw do

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  resources :websites do
    resources :votes, only: [:create]
  end
end