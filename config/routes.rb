Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :gifts, only: %i[show index new create edit update] do
      resources :purchases, only: %i[index new create show]
    end
  end

  resources :gifts, only: %i[edit update ]
  resources :purchases, only: %i[index]
  get 'my_events', to: 'events#my_events'
  get 'my_events/:id', to: 'events#my_event', as: :my_event

  delete '/events/:event_id/gifts/:id', to: 'gifts#destroy', as: 'event_gift_destroy'
