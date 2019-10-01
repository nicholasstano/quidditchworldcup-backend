class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :team_id, :team_name, :position, :quaffle_scored, :quaffle_saved, :snitch_captured, :bludgers_smashed, :quaffle_scored_playoffs, :quaffle_saved_playoffs, :bludgers_smashed_playoffs, :snitch_captured_playoffs
end