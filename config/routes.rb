Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books 
      resources :shelves  
      resources :users, only: [] do
        collection do
          post 'register', to: 'users#register'
          get 'login', to: 'users#login'
          get 'current_user_id', to: 'users#current_user_id'
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
