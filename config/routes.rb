Rails.application.routes.draw do
  resources :customers, only: [:index]
  
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :products, only: [:index, :show] do
    member do
	  post :add_to_cart
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

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
