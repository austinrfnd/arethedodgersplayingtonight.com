require 'spec_helper'

describe GamesController do
  describe "routing" do
    it "recognizes and generates #new" do
      { :get => "/games/new" }.should route_to(:controller => "games", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/games/1" }.should route_to(:controller => "games", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/games/1/edit" }.should route_to(:controller => "games", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/games" }.should route_to(:controller => "games", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/games/1" }.should route_to(:controller => "games", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/games/1" }.should route_to(:controller => "games", :action => "destroy", :id => "1") 
    end
    
    describe "default route" do
      it "should generate params for #contact_seller" do
        params_from(:get, "/").should == {:controller => "games", :action => "index"}
      end
    end
  end
end
