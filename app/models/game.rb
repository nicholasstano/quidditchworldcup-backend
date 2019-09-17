class Game < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :week
    has_many :player_games
    has_many :players, through: :player_games

    def teams_info 
        {
            home_id: home.id,
            home_name: home.name,
            home_score: home.points_for,
            away_id: away.id,
            away_name: away.name,
            away_score: away.points_for
        }
    end
end
