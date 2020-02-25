class PlayerGameSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :game_id, :quaffle_scored, :quaffle_saved, :bludger_smashed, :snitch_caught, :quaffle_shots_against
end
