Rails.application.routes.draw do
  devise_for :users
  root "boxes#index"
  resources :boxes, only: [:index, :edit, :destroy, :update, :create] do
    resources :connects, only: [:index, :destroy, :create]
  end
end
