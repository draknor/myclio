Myclio::Application.routes.draw do


  authenticated :user do
    root :to => 'users#show'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :data
    resources :datum_types
  end
end