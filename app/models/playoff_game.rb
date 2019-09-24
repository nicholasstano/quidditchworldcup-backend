class PlayoffGame < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :week
    has_many :player_playoff_games
    has_many :players, through: :player_playoff_games
end
