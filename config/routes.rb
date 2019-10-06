Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users,only: [:index]
end

  resources :signup do
    collection do
      get 'login'
      get 'register'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'step5' # ここで、入力の全てが終了する
    end
  end
end

