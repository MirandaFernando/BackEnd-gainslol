
Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> master
=======
    resources :bets
>>>>>>> added model and controller bet
>>>>>>> added model and controller bet
    resources :teams
    resources :leagues
  end
end