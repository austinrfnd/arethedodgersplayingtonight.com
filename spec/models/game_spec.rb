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
end
