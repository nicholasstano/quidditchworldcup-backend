class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :team_id, :team_name

end
