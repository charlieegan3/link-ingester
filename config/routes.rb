Rails.application.routes.draw do
  root "links#index"
  resources :emails
  resources :links, only: :index
end
