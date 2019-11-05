class EliminatorLeague < ApplicationRecord
    has_many :eliminator_league_users
    has_many :users, through: :eliminator_league_users
    belongs_to :host, class_name: 'User'

    def game_host
        self.host.username
    end
end
