Rails.application.routes.draw do
  resources :steps
  resources :tasks
  resources :users
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'stepsforme' => 'steps#steps_for_me'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
