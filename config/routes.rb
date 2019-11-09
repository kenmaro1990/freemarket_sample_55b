Rails.application.routes.draw do

  devise_for :users
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

  resources :card do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:show] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'complete', to: 'purchase#complete'
    end
  end

  resources :items do
    collection do
      get 'transaction'
    end
  end

  resources :categories do
  end
  
  resources :brands do
  end
end