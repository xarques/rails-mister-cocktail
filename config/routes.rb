Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :destroy]  do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]

  # resources :restaurants, only: [:index, :show, :new, :create] do
  #   resources :reviews, only: [ :index, :new, :create ]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
