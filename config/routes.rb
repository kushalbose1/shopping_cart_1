Rails.application.routes.draw do
  #get 'shopping/index'
  resources :products do 
    resources :productimgs, only: [:new, :create, :index, :show]
  end
    resources :shopping
    root "shopping#index" 
   devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      resources :categories
   root "welcome#index"

end
 
