Rails.application.routes.draw do
  resources :customers, only: [:index] do
    member do
	  post :remember_do_call
	  post :mark_as_called
	end
  end
  mount Ckeditor::Engine => '/ckeditor'
  resources :products
  resources :catagories
  root to: 'store#home'
  
  get 'store', to: 'store#home'

  get 'store/about_us'

  get 'store/FAQ'

  get 'store/search'

  get 'store/contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
