require 'spec_helper'

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
  
  describe "next_game" do
    it "should return the next game" do 
      next_next_game = Game.create!(@valid_attributes.merge(:game_at => Time.now + 10.days))
      next_game = Game.create!(@valid_attributes.merge(:game_at => Time.now + 1.hour))
      Game.next_game.should be_eql(next_game)
    end
  end
end
