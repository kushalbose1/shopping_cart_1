Rails.application.routes.draw do
  resources :products do 
    resources :productimgs, only: [:new, :create, :index, :show]
  end
   devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      resources :categories
   root "welcome#index"
end
 
