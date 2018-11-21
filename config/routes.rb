Rails.application.routes.draw do
  resources :checkouts
  #get 'order/index'
  #get 'cart/index'
  #get 'shopping/index'
  resources :products do 
    resources :productimgs, only: [:new, :create, :index, :show]
  	resources :orders
  end
    resources :shopping
    resources :carts do
      member do
      	get :add_to_cart
      end
  end
   devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      resources :categories
   root "welcome#index"

end
 
