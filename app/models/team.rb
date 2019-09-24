class Team < ApplicationRecord
    has_many :games
    has_many :players
    has_many :playoff_games
    has_many :weeks, through: :games
    has_many :weeks, through: :playoff_games

    def player_roster 
        self.players.map {|player| {
            id: player.id, 
            name: player.name,
            position: player.position, 
            quaffle_scored: player.quaffle_scored,
            quaffle_saved: player.quaffle_saved,
            snitch_captured: player.snitch_captured,
            bludgers_smashed: player.bludgers_smashed

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

    def top_sixteen 
        Team.all.sort {|teamOne, teamTwo| teamTwo.wins <=> teamOne.wins}
    end
end

