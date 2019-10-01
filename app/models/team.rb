class Team < ApplicationRecord
    has_many :games
    has_many :players
    has_many :playoff_games
    has_many :weeks, through: :games
    has_many :playoff_weeks, through: :playoff_games

    def player_roster 
        Player.where("team_id = ?", self.id).map {|player| {
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
        sched_games = Game.where("home_id = ? OR away_id = ?", self.id, self.id)
        sched_games.map { |g| g.teamInfo } 
    end

end

