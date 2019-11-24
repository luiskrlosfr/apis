Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }, skip: [:registrations]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :users
  resources :abilities
  resources :availability
end
