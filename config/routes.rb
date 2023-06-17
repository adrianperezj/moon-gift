Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :gifts, only: [:show,:index,:new, :create]
  end
  resources :gifts, only: [:edit, :update, :destroy] do
    resources :purchases, only: [:new, :create]
  end
end
