Rails.application.routes.draw do
	resources :items

	get 'transactions/check_out'
	get 'transactions/check_in'
	resources :transactions

	get 'admin/index'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	resources :users

	get 'index/index'

	root to: 'index#index'

	resources :item_types
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
