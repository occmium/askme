Rails.application.routes.draw do
  resources :users # Ресурс пользователей c поддержкой удаления
  # resources :sessions, only: [:new, :create, :destroy] # Ресурс сессий (только три экшена :new, :create, :destroy)
  resource :session, only: [:new, :create, :destroy]
  # Ресурсы сессий во множественном числе, хотя у
  # каждого юзера только одна собственная сессия. Чужие сессии он видеть не
  # может, в отличие от юзеров: чужие профили он просматривать может. Для
  # ресурсов у Рельсов есть хелпер и в единственном числе
  resources :questions, except: [:show, :new, :index] # Ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :hashtags, only: [:show], param: :name

  root to: 'users#index'

  # Синонимы путей — в дополнение к созданным в ресурсах выше.
  #
  # Для любознательных: синонимы мы добавили, чтобы показать одну вещь и потом
  # их удалим.
  # Из раутов удаляем синонимы, которые не соответствуют REST
  # get 'sign_up' => 'users#new'
  # get 'log_out' => 'sessions#destroy'
  # get 'log_in' => 'sessions#new'
end
