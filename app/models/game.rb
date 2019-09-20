class Game < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :week
    has_many :player_games
    has_many :players, through: :player_games

    def teamInfo
        {
            game_id: self.id,
            week_id: week.id,
            completed: self.completed,
            home_name: home.name,
            home_score: home_score,
            home_id: home.id,
            away_name: away.name,
            away_score: away_score,
            away_id: away.id,
        }
    end
end
