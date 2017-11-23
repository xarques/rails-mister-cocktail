Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :destroy]  do
    resources :doses, only: [:create]
    # resources :doses, only: [:new]
  end
  resources :doses, only: [:destroy]
end
