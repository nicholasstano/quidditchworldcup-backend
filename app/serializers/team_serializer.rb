class TeamSerializer < ActiveModel::Serializer
  attributes :id, :wins, :losses, :points_for, :points_against, :name, :flag, :division, :player_roster
end
