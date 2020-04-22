Rails.application.routes.draw do

	# STATIC
	root to: "static#home"
	get "/home" => "static#home"
	get "/statistics" => "static#statistics"
	get "/about" => "static#about"
	get "/donate" => "static#donate"
	get "/rgpd" => "static#rgpd"
	resources :contact, only: [:new, :create]
	resources :charges, only: [:new, :create]

	# USERS
	devise_for :ngos, path: 'ngos',
		controllers: { sessions: 'ngos/sessions', registrations: 'ngos/registrations',
								 passwords: 'ngos/passwords', confirmations: 'ngos/confirmations',
								 unlocks: 'ngos/unlocks' }
	resources :ngos, only: [:index, :show, :edit, :update]
	devise_for :users, path: 'users',
		controllers: { sessions: 'users/sessions', registrations: "users/registrations",
								 passwords: 'users/passwords', confirmations: 'users/confirmations',
								 unlocks: 'users/unlocks' }
	resources :users, only: [:show, :edit, :update]

	# ADMIN
	scope "admin", module: "admin", as: "admin" do
		resources :commitments
		resources :themes
		resources :users
		resources :ngos
		put '/admin/ngos/:id/validate' => 'ngos#change_status', :as => 'change_status'
	end

	# MODELS
	resources :commitments, only: [:show, :index] do
		resources :user_commitments, only: [:create, :destroy]
	end

	resources :themes, only: [:show, :index] do
		resources :user_themes, only: [:create, :destroy]
	end

	resources :forums, only: [:index, :show] do
		resources :posts do
			resources :replies, only: [:new, :create, :edit, :update, :destroy]
		end
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
