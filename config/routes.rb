Rails.application.routes.draw do

	devise_for :users
	devise_scope :user do
    	post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  	end
	root :to =>'homes#top'
	resources :users, only: [:show, :edit, :update]
	resources :posts do
		resources :favorites, only: [:create, :destroy]
		resources :comments, only: [:create]
	end
	resources :genres, only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
