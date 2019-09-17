class Player < ApplicationRecord
    belongs_to :team 
    has_many :player_games
    has_many :games, through: :player_games

    def team_name 
        self.team.name
    end

end
