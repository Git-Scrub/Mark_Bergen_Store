Rails.application.routes.draw do
  resources :products
  resources :product_types
  root to: 'store#home'
  get 'store/home'

  get 'store/about_us'

  get 'store/FAQ'

  get 'store/search'

  get 'store/contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
