Rails.application.routes.draw do

  resources :websites do
    resources :votes, only: [:create]
  end
end