Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :events
  end

  resources :events do
    resources :gifts, only: [:show,:index,:new, :create]
  end
  resources :gifts, only: [:edit, :update, :destroy] do
    resources :purchases, only: [:new, :create]
  end
end

# Rails.application.routes.draw do
#   get 'signup', to: 'users#new'
#   post 'signup', to: 'users#create'
#   get 'login', to: 'users#login'
#   post 'login', to: 'users#authenticate'
# end
