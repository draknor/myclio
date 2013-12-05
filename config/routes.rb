Myclio::Application.routes.draw do


  authenticated :user do
    root :to => 'data#new'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :data
    resources :datum_types
    resources :groups
  end
end