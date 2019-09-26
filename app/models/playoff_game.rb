class PlayoffGame < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :playoff_week
    has_many :player_playoff_games
    has_many :players, through: :player_playoff_games

    def teamInfo
        player_playoff_game = self.player_playoff_games.select {|player| player.snitch_caught == 150}
        player = player_playoff_game.map {|player| player.player.name}
        snitch_caught_by = player[0]
        team = player_playoff_game.map {|player| player.player.team.name}
        team_captured_snitch = team[0]
        {
            playoff_game_id: self.id,
            snitch_caught_by: snitch_caught_by,
            team_captured_snitch: team_captured_snitch,
            playoff_week_id: self.playoff_week_id,
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
