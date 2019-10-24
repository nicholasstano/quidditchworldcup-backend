Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/player_games/home_players', to: 'player_games#home_players'
  get '/playoff_games/roundOneGames', to: 'playoff_games#roundOneGames'
  get '/playoff_games/roundTwoGames', to: 'playoff_games#roundTwoGames'
  get '/playoff_games/roundThreeGames', to: 'playoff_games#roundThreeGames'
  get '/playoff_games/roundFourGames', to: 'playoff_games#roundFourGames'
  get '/playoff_games/winner', to: 'playoff_games#winner'
  post '/playoff_games/winner', to: 'playoff_games#winner'
  post '/login', to: 'auth#login'
  get '/autologin', to: "auth#autologin"

  resources :players
  resources :games
  resources :playoff_games
  resources :weeks 
  resources :playoff_weeks
  resources :teams
  resources :player_games
  resources :player_playoff_games
  resources :users
  
end
