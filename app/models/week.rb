class Week < ApplicationRecord
    has_many :games

    def week_games 
        self.games.map do |game|
            {
                game_id: game.id,
                game_completed: game.completed,
                home_id: game.home.id,
                home_name: game.home.name,
                home_flag: game.home.flag,
                home_score: game.home_score,
                away_id: game.away.id,
                away_name: game.away.name,
                away_score: game.away_score,
                away_flag: game.away.flag
            }
        end
    end
end
