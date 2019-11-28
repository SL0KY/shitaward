Rails.application.routes.draw do

  resources :websites
  delete '/websites/:id', to: 'websites#destroy'

end