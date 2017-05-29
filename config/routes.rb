Rails.application.routes.draw do
  get 'contact_form/new'

  get 'contact_form/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#index"
  resources :activities
  resources :users
  resources :attendances

  resources :user_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'user_sessions#new'
get 'logout' => 'user_sessions#destroy'
get 'about' => 'static#about'
get 'join' => 'static#join'
get 'gallery' => 'static#gallery'
get 'contact' => 'static#contact'
get 'forms' => 'static#forms'
post 'contact_email' => 'static#contact_email'
end