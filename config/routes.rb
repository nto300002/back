Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  resources :tests
  namespace :api do
    # resources :messages
    get 'messages/admin', to: "messages#admin"
    get 'messages/protected', to: "messages#protected"
    get 'messages/public', to: "messages#public"
  end
end
