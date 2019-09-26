Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/player_games/home_players', to: 'player_games#home_players'
  get '/playoff_games/roundOneGames', to: 'playoff_games#roundOneGames'
  post '/playoff_games/roundOneGames', to: 'playoff_games#roundOneGames'
  
  resources :players
  resources :games
  resources :playoff_games
  resources :weeks 
  resources :playoff_weeks
  resources :teams
  resources :player_games
  resources :player_playoff_games
  
end
