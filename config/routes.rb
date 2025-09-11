Rails.application.routes.draw do
  #get 'books/index'
  #get 'books/new'
  #get 'books/edit'
  #get 'books/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #resources :posts
  
  root "books#index"
  resources :books do 
    get 'delete', on: :member
  end  
end
