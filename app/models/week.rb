class Week < ApplicationRecord
    has_many :games
    has_many :playoff_games

    def week_games 

        if self.playoff_games.length > 0 

        self.playoff_games.map do |game|
            {
                playoff_game_id: game.id,
                game_completed: game.completed,
                home_id: game.home.id,
                home_name: game.home.name,
                home_flag: game.home.flag,
                home_score: game.home_score,
                away_id: game.away.id,
                away_name: game.away.name,
                away_score: game.away_score,
                away_flag: game.away.flag,   
                # snitch_caught_by: game.teamInfo[:snitch_caught_by],
                # team_captured_snitch: game.teamInfo[:team_captured_snitch],
                week_id: self.id
            }
        end
        
        elsif self.games.length > 0 

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
                away_flag: game.away.flag,   
                snitch_caught_by: game.teamInfo[:snitch_caught_by],
                team_captured_snitch: game.teamInfo[:team_captured_snitch],
                week_id: self.id
            }
        end
        else 
        return []
    end
end
end
