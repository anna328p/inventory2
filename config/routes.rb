Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	get 'index/index'

	authenticated :user do
		root to: 'index#index', as: :authenticated_root
	end
	root to: redirect('/users/sign_in')

  resources :transactions
  resources :items
  resources :item_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
