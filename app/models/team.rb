class Team < ApplicationRecord
    has_many :games
    has_many :players
    has_many :weeks, through: :games

    def player_roster 
        self.players.map {|player| {
            id: player.id, 
            name: player.name,
            position: player.position
        }}
    end
end
