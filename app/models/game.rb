class Game < ActiveRecord::Base
  validates_presence_of :game_at, :opponent, :location
  
  def self.game_today?
    if Game.find(:first, :conditions => ["game_at < ? AND game_at > ?", Time.now+1.day, Time.now-1.day]).nil?
      false
    else
      true
    end
  end
  
  def self.next_game
    Game.find(:first, :conditions => ["game_at > ?", Time.now], :order => "game_at ASC")
  end
end
