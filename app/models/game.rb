class Game < ActiveRecord::Base
  validates_presence_of :game_at, :opponent, :location
  
  def self.game_today?
    if self.current_game.nil?
      false
    else
      true
    end
  end
  
  def self.current_game
    Game.find(:first, :conditions => ["game_at < ? AND game_at > ?", Time.now+1.day, Time.now-1.day])
  end
  
  def self.next_game
    Game.find(:first, :conditions => ["game_at > ?", Time.now], :order => "game_at ASC")
  end
end
