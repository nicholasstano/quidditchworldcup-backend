Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/player_games/home_players', to: 'player_games#home_players'
  get '/playoff_games/sixteen', to: 'playoff_games#sixteen'
  
  resources :players
  resources :games
  resources :weeks 
  resources :teams
  resources :player_games
  resources :playoff_games
  resources :player_playoff_games
end
