Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    collection do
      get 'identification'
      get 'logout'
    end 
  end

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