class Week < ApplicationRecord
    has_many :games

    def week_games 
        self.games.map do |game|
            {
                game_id: game.id,
                home_id: game.home.name,
                home_score: game.home_score,
                away_id: game.away.name,
                away_score: game.away_score
            }
        end
    end
end
