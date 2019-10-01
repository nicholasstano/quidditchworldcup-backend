class Player < ApplicationRecord
    belongs_to :team 
    has_many :player_games
    has_many :games, through: :player_games
    has_many :player_playoff_games
    has_many :playoff_games, through: :player_playoff_games

    def team_name 
        self.team.name
    end

    def quaffle_scored 
        regular_season_points = PlayerGame.where("player_id = ?", self.id).inject(0) {|sum, player_games| (sum + player_games.quaffle_scored)}
        regular_season_points / 10 
    end

    def quaffle_scored_playoffs
        playoff_points = PlayerPlayoffGame.where("player_id = ?", self.id).inject(0) {|sum, player_games| (sum + player_games.quaffle_scored)}
        playoff_points / 10 
    end

    def quaffle_saved
        PlayerGame.where("player_id = ?", self.id).inject(0) {|sum, player_games| (sum + player_games.quaffle_saved)}
    end

    def quaffle_saved_playoffs
        PlayerPlayoffGame.where("player_id = ?", self.id).inject(0) {|sum, player_games| (sum + player_games.quaffle_saved)}
    end

    def bludgers_smashed
        PlayerGame.where("player_id =?", self.id).inject(0) {|sum, player_games| (sum + player_games.bludger_smashed)}
    end

    def bludgers_smashed_playoffs
        PlayerPlayoffGame.where("player_id =?", self.id).inject(0) {|sum, player_games| (sum + player_games.bludger_smashed)}
    end

    def snitch_captured
        snitch_caught = PlayerGame.where("player_id =?", self.id).inject(0) {|sum, player_games| (sum + player_games.snitch_caught)}
        snitch_caught / 150
    end
    def snitch_captured_playoffs
        snitch_caught = PlayerPlayoffGame.where("player_id =?", self.id).inject(0) {|sum, player_games| (sum + player_games.snitch_caught)}
        snitch_caught / 150
    end
end
