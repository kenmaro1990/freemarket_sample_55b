Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'
  resources :users do
    collection do
      get 'identification'
      get 'card'
      get 'logout'
      get 'edit_profile'
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

  resources :items do
  end

  resources :categories do
  end
  
  resources :brands do
  end
end