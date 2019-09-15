Rails.application.routes.draw do
  resources :users
  resources :questions
  root to: 'users#index'

  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # get 'show' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
