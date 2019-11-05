class EliminatorLeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_host, :users
end
