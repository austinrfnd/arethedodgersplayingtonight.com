require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Game do
  before(:each) do
    @valid_attributes = {
      :game_at => Time.now,
      :opponent => "value for opponent",
      :telivision => "value for telivision",
      :radio => "value for radio",
      :location => "value for location",
      :away => false
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
  
  it "should be valid with minimum amount of info" do
    Game.create!({:game_at => Time.now, :opponent => "Giants", :location => 'asdf', :away => true})
  end
  
  it "should get recent games from the past 30 days" do
    Game.create!(@valid_attributes.merge(:game_at => 29.days.ago))
    @games = Game.recent_games
    @games.should_not be_include(games(:old))
    @games.each_with_index do |game, index|
      @games[index - 1].game_at.should > game.game_at if index > 1
      game.game_at.should_not > Time.now
    end
  end
  
  describe "game_today?" do
    it "should get current_game" do
      @game = Game.create!(@valid_attributes)
      Game.current_game.should be_eql(@game)
    end
    
    it "should return true if there is a game today" do
      Game.create!(@valid_attributes)
      Game.should be_game_today
    end
    
    it "should return false" do
      Game.should_not be_game_today
    end
  end
  
  describe 'game_at?' do
    it "should return true if game_at" do
      Game.create!(@valid_attributes.merge(:game_at => 29.days.ago))
      Game.should be_game_at(29.days.ago)
    end
    
    it "should return false if no game_at" do
      Game.should_not be_game_at(5.days.ago)
    end
  end
  
  describe "next_game" do
    it "should return the next game" do 
      next_next_game = Game.create!(@valid_attributes.merge(:game_at => Time.now + 10.days))
      next_game = Game.create!(@valid_attributes.merge(:game_at => Time.now + 1.hour))
      Game.next_game.should be_eql(next_game)
    end
  end
end
