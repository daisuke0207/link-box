Rails.application.routes.draw do
  devise_for :users
  root "boxes#index"
  resources :boxes, only: %i[index edit destroy update create] do
    resources :connects, only: %i[index destroy create] do
      collection do
        delete 'destroy_all'
        get 'search'
      end
    end
  end
end
