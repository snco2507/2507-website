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
	get 'training' => 'static#training'
	post 'uploadTP' => 'static#uploadTP'
	post 'uploadST' => 'static#uploadST'
	post 'uploadNT' => 'static#uploadNT'
	post 'contact_email' => 'static#contact_email'
	post 'report_email' => 'activities#report'
	post 'bars' => 'activities#bars'
	post 'boxes' => 'activities#boxes'

	get 'archive/:id' => 'activities#archive', as: 'archive_activity'

	get '/redirect', to: 'activities#redirect', as: 'redirect'
	get '/callback', to: 'activities#callback', as: 'callback'

	get '/calendars', to: 'activities#calendars', as: 'calendars'

	get '/events/:calendar_id', to: 'example#events', as: 'events', calendar_id: /[^\/]+/
end