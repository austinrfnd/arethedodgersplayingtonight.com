class Game < ActiveRecord::Base
  validates_presence_of :game_at, :opponent, :location
end
