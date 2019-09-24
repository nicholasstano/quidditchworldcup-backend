class Game < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :week
    has_many :player_games
    has_many :players, through: :player_games

    def teamInfo
        player_game = self.player_games.select {|player| player.snitch_caught == 150}
        player = player_game.map {|player| player.player.name}
        snitch_caught_by = player[0]
        player_game = self.player_games.select {|player| player.snitch_caught == 150}
        team = player_game.map {|player| player.player.team.name}
        team_captured_snitch = team[0]
        {
            game_id: self.id,
            snitch_caught_by: snitch_caught_by,
            team_captured_snitch: team_captured_snitch,
            week_id: week.id,
            game_completed: self.completed,
            home_name: home.name,
            home_flag: home.flag,
            home_score: home_score,
            home_id: home.id,
            away_name: away.name,
            away_flag: away.flag,   
            away_score: away_score,
            away_id: away.id,
        }
    end
end