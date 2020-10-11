Rails.application.routes.draw do
  devise_for :users
  root "boxes#index"
  resources :boxes, only: [:index]
end
