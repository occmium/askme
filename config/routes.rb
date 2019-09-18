Rails.application.routes.draw do

  resources :users # Ресурс пользователей c поддержкой удаления
  resources :sessions, only: [:new, :create, :destroy] # Ресурс сессий (только три экшена :new, :create, :destroy)
  resources :questions, except: [:show, :new, :index] # Ресурс вопросов (кроме экшенов :show, :new, :index)

  root to: 'users#index'

  # Синонимы путей — в дополнение к созданным в ресурсах выше.
  #
  # Для любознательных: синонимы мы добавили, чтобы показать одну вещь и потом
  # их удалим.
  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
