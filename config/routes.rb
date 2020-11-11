Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  
  resources :users

  #static pages
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
end
