Rails.application.routes.draw do
  resources :users, except: [:destroy] # Ресурс пользователей (экшен destroy не поддерживается)
  resources :questions
  root to: 'users#index'
end
