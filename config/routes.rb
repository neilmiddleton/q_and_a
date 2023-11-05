Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :questions, only: [:new, :show, :create] do
    resources :answers, only: [:create]
  end
end
