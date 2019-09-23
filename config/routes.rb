Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/player_games/home_players', to: 'player_games#home_players'
  get '/weeks/top_sixteen', to: 'weeks#top_sixteen'
  resources :players
  resources :games
  resources :weeks 
  resources :teams
  resources :player_games

end
