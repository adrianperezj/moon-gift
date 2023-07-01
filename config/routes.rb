Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :gifts, only: %i[show index new create edit update] do
      resources :purchases, only: %i[index new create show]
    end
  end

  resources :gifts, only: %i[edit update ]

  delete '/events/:event_id/gifts/:id', to: 'gifts#destroy', as: 'event_gift_destroy'
end

# Rails.application.routes.draw do
#   get 'signup', to: 'users#new'
#   post 'signup', to: 'users#create'
#   get 'login', to: 'users#login'
#   post 'login', to: 'users#authenticate'
# end
