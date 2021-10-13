Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  delete '/users/:id', to: 'users#destroy'
  root to: 'books#index'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
