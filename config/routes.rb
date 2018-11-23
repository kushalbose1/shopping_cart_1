Rails.application.routes.draw do
  #get 'oders/index'
  #get 'oders/show'
  #get 'oders/new'
  
  #get 'order/index'
  #get 'cart/index'
  #get 'shopping/index'
  get '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  get 'carts/:id' => "carts#show", as: "cart"
delete 'carts/:id' => "carts#destroy"
post 'items' => "items#create"
post 'items/:id/add' => "items#add_quantity", as: "item_add"
post 'items/:id/reduce' => "items#reduce_quantity", as: "item_reduce"
post 'items' => "items#create"
get 'items/:id' => "items#show", as: "item"
delete 'items/:id' => "items#destroy"

  resources :products do 
    resources :productimgs, only: [:new, :create, :index, :show]
  	resources :oders
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
 
