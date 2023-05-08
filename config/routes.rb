Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "dashboard#index"

  # Define routes for user authentication.
  devise_for :users

  resources :articles
  resource :profile, only: %i[show edit update destroy]
end
