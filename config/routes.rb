
Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
<<<<<<< HEAD
    mount_devise_token_auth_for 'User', at: 'auth'
=======
>>>>>>> master
    resources :teams
    resources :leagues
  end
end