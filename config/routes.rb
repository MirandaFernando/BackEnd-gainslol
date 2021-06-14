Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :teams
    resources :leagues
  end
end