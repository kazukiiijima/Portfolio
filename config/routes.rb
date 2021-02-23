Rails.application.routes.draw do

	devise_for :users
	root :to =>'homes#top'
	resources :users, only: [:show, :edit, :update]
	resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
		resources :favorites, only: [:create, :destroy]
		resources :comments, only: [:create]
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
