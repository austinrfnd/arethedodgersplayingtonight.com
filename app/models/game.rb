class Game < ActiveRecord::Base
  validates_presence_of :game_at, :opponent, :location
  
  named_scope :recent_games, :conditions => ['game_at > ? AND game_at < ?', 30.days.ago, Time.now], :order => "game_at ASC"
    
  def self.game_today?
    self.game_at?(Time.now)
  end
  
  def self.game_at?(day)
    if current_game(day).nil?
      false
    else
      true
    end      
  end
  
  def self.current_game(day = Time.now)
    Game.find(:first, :conditions => ["game_at < ? AND game_at > ?", day + 1.day, day - 1.day])
  end
  
  def self.next_game
    Game.find(:first, :conditions => ["game_at > ?", Time.now + 1.day], :order => "game_at ASC")
  end
end
