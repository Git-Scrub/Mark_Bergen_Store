Rails.application.routes.draw do
  resources :customers, only: [:index]

  mount Ckeditor::Engine => '/ckeditor'

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :add_existing_to_cart
      post :remove_existing_from_cart
    end
  end

  post '/create_new_user', to: 'store#create_new_user'
  post '/create_new_order', to: 'store#create_new_order'
  post 'users/sign_in', to: 'users#sign_in'

  resources :store, only: [:about, :FAQ, :search, :contact, :cart] do
    member do
      post :remove_item_from_cart
      post :create_new_user
    end
  end

  resources :catagories

  resources :users

  root to: 'store#home'

  get 'store', to: 'store#home'

  get 'store/about_us'

  get 'store/FAQ'

  get 'store/search'

  get 'store/contact'

  get 'store/cart'

  get 'store/sign_up'

  get 'store/sign_in'

  get 'store/sign_out'

  get 'store/check_out'

  get 'store/order_summary'

  get 'store/finalize_order'
  
  get 'store/finished_purchase'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
