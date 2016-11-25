Rails.application.routes.draw do
  resources :users
  resources :customers, only: [:index]
  
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :products, only: [:index, :show] do
    member do
	  post :add_to_cart
	  post :add_existing_to_cart
	  post :remove_existing_from_cart
	end
  end
  
  resources :store, only: [:about, :FAQ, :search, :contact, :cart] do
    member do
      post :remove_item_from_cart
	end
  end
  
  resources :catagories
  root to: 'store#home'
  
  get 'store', to: 'store#home'

  get 'store/about_us'

  get 'store/FAQ'

  get 'store/search'

  get 'store/contact'
  
  get 'store/cart'
  
  get 'store/sign_up'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
