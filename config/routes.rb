Rails.application.routes.draw do
  devise_for :users, 
  controllers: { sessions: 'users/sessions', 
                 omniauth_callbacks: 'users/omniauth_callbacks', 
                 registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
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
      post'login'
      delete 'logout'
      get 'register'
      get 'information'
      get 'phonenumber'
      get 'address'
      get 'card'
      get 'complete'
    end
  end

  resources :items do
    collection do
      get 'transaction'
    end
  end

  resources :categories do
    member do
      get 'child'
      get 'grandchild'
    end
  end
  
  resources :brands do
  end
end