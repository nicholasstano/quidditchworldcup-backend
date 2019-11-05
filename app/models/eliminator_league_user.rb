class EliminatorLeagueUser < ApplicationRecord
    belongs_to :user 
    belongs_to :eliminator_league
    def eliminator_league_user
        {
            id: self.id,
            username: self.user.username,
            league_id: self.eliminator_league.id,
            league_name: self.eliminator_league.name
        }
    end
end
