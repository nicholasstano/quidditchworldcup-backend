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
        quaffled_scored = self.player_games.inject(0) {|sum, player_games| (sum + player_games.quaffle_scored)}
        quaffled_scored / 10 
    end

    def quaffle_saved
        self.player_games.inject(0) {|sum, player_games| (sum + player_games.quaffle_saved)}
    end

    def bludgers_smashed
        self.player_games.inject(0) {|sum, player_games| (sum + player_games.bludger_smashed)}
    end

    def snitch_captured
        snitch_caught = self.player_games.inject(0) {|sum, player_games| (sum + player_games.snitch_caught)}
        snitch_caught / 150
    end

    # def quaffle_scored_playoffs
    #     quaffled_scored = self.player_playoff_games.inject(0) {|sum, player_games| (sum + player_games.quaffle_scored)}
    #     quaffled_scored / 10 
    # end 

    # def quaffle_saved_playoffs
    #     self.player_playoff_games.inject(0) {|sum, player_games| (sum + player_games.quaffle_saved)}
    # end
    # def bludgers_smashed_playoffs
    #     self.player_playoff_games.inject(0) {|sum, player_games| (sum + player_games.bludger_smashed)}
    # end
    # def snitch_captured_playoffs
    #     snitch_caught = self.player_playoff_games.inject(0) {|sum, player_games| (sum + player_games.snitch_caught)}
    #     snitch_caught / 150
    # end
end
