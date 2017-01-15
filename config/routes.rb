Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#index"
  resources :activities
  resources :users

  resources :user_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'user_sessions#new'
get 'logout' => 'user_sessions#destroy'
get 'about' => 'static#about'
get 'join' => 'static#join'
end
