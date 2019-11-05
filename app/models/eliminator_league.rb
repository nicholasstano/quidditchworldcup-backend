class EliminatorLeague < ApplicationRecord
    has_many :eliminator_league_users
    has_many :users, through: :eliminator_league_users
    belongs_to :host, class_name: 'User'

    def eliminator_league
        {
            id: self.id,
            name: self.name,
            host: self.host.username,
            users: self.users.map {|u| {username: u.username, id: u.id}}
        } 
    end
end
