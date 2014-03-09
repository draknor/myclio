Myclio::Application.routes.draw do


  authenticated :user do
    root :to => 'data#new'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :data
    resources :datum_types do
      member do
        put 'activate'
        put 'deactivate'
      end
    end
    resources :groups
  end


end