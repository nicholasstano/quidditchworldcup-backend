class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :team_id, :team_name, :position, :quaffle_scored, :quaffle_saved, :snitch_captured, :bludgers_smashed
end
