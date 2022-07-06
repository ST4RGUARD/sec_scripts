Rails.application.routes.draw do
  resources :posts
  get '/about', to: 'pages#about'
  get '/posts', to: 'pages#posts'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
