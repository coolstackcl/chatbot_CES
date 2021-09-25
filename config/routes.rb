Rails.application.routes.draw do
  post '/webhooks' => 'webhooks#comunicacion'
  get '/' => 'sessions#login'
  post '/valid_login' => 'sessions#valid_login'

  resources :cursos
  resources :asignaturas
  resources :profesors
  resources :usuarios
  resources :establecimientos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
