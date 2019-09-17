class WeekSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :games_completed, :week_games
end
