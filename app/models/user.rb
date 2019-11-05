class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_secure_password
    has_many :eliminator_league_users
    has_many :eliminator_leagues, through: :eliminator_league_users
    has_many :eliminator_leagues

    def user 
        {
            username: self.username,
            eliminator_leagues: self.eliminator_league_users.map {|el| {id: el.eliminator_league.id, name: el.eliminator_league.name}}
        }
    end
end
