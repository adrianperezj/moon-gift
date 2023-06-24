Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :events
  end

  resources :events do
    resources :gifts, only: [:show,:index,:new, :create] do
      resources :purchases, only: [:new, :create, :show]
    end
  end

  resources :gifts, only: [:edit, :update, :destroy]
end

# Rails.application.routes.draw do
#   get 'signup', to: 'users#new'
#   post 'signup', to: 'users#create'
#   get 'login', to: 'users#login'
#   post 'login', to: 'users#authenticate'
# end
