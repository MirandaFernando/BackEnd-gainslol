Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    resources :teams
    resources :leagues
  end
end