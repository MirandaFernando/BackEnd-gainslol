
Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> master
=======
    resources :bets
>>>>>>> added model and controller bet
>>>>>>> added model and controller bet
=======
    resources :bets
>>>>>>> fix conflits
    resources :teams
    resources :leagues
  end
end