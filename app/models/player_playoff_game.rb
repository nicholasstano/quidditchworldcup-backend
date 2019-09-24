class PlayerPlayoffGame < ApplicationRecord
    belongs_to :player 
    belongs_to :playoff_game 
end
