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

    def games_played
        self.wins + self.losses
    end
    
    def schedule 
        sched_games = Game.all.select do |game| 
            self.id == game.home_id || self.id == game.away.id
        end
        sched_games.map { |g| g.teamInfo } 
    end
end

