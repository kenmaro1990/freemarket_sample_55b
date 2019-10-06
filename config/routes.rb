Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'signup#login'
  resources :users,only: [:index]

  resources :signup do
    collection do
      get 'login'
      get 'register'
      get 'information'
      get 'phonenumber'
      get 'address'
      get 'card'
      get 'complete'
    end
  end
end