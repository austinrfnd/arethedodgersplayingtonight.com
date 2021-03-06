require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do
  integrate_views
  
  def mock_game(stubs={})
    @mock_game ||= mock_model(Game, stubs)
  end
  
  describe 'routing' do
    it "recognizes and generates #named routes" do
      { :get => "/" }.should route_to(:controller => "games", :action => "index")
    end
    
    it "should route recent" do
      { :get => "/recent.xml" }.should route_to(:controller => "games", :action => "index")
      { :get => "/recent.json" }.should route_to(:controller => "games", :action => "index")
    end
  end

  describe "GET index" do
    describe 'html' do
      it "should be successful on non-game day" do
        Game.should_receive(:current_game).and_return(games(:one))
        get :index
        response.should be_success
      end
      
      it "should be successful on game days" do
        get :index
        response.should be_success
      end
      
      it "should be successful if no next game" do
        Game.should_receive(:next_game).and_return(nil)
        get :index
        response.should be_success        
      end
    end
    
    it "should get JSON successfully" 
    
    it "should get XML successfully" do
      get :index, :format => 'xml'
      response.should be_success
    end
  end
  # 
  # describe "GET show" do
  #   it "assigns the requested game as @game" do
  #     Game.stub(:find).with("37").and_return(mock_game)
  #     get :show, :id => "37"
  #     assigns[:game].should equal(mock_game)
  #   end
  # end
  # 
  # describe "GET new" do
  #   it "assigns a new game as @game" do
  #     Game.stub(:new).and_return(mock_game)
  #     get :new
  #     assigns[:game].should equal(mock_game)
  #   end
  # end
  # 
  # describe "GET edit" do
  #   it "assigns the requested game as @game" do
  #     Game.stub(:find).with("37").and_return(mock_game)
  #     get :edit, :id => "37"
  #     assigns[:game].should equal(mock_game)
  #   end
  # end
  # 
  # describe "POST create" do
  # 
  #   describe "with valid params" do
  #     it "assigns a newly created game as @game" do
  #       Game.stub(:new).with({'these' => 'params'}).and_return(mock_game(:save => true))
  #       post :create, :game => {:these => 'params'}
  #       assigns[:game].should equal(mock_game)
  #     end
  # 
  #     it "redirects to the created game" do
  #       Game.stub(:new).and_return(mock_game(:save => true))
  #       post :create, :game => {}
  #       response.should redirect_to(game_url(mock_game))
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved game as @game" do
  #       Game.stub(:new).with({'these' => 'params'}).and_return(mock_game(:save => false))
  #       post :create, :game => {:these => 'params'}
  #       assigns[:game].should equal(mock_game)
  #     end
  # 
  #     it "re-renders the 'new' template" do
  #       Game.stub(:new).and_return(mock_game(:save => false))
  #       post :create, :game => {}
  #       response.should render_template('new')
  #     end
  #   end
  # 
  # end
  # 
  # describe "PUT update" do
  # 
  #   describe "with valid params" do
  #     it "updates the requested game" do
  #       Game.should_receive(:find).with("37").and_return(mock_game)
  #       mock_game.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :game => {:these => 'params'}
  #     end
  # 
  #     it "assigns the requested game as @game" do
  #       Game.stub(:find).and_return(mock_game(:update_attributes => true))
  #       put :update, :id => "1"
  #       assigns[:game].should equal(mock_game)
  #     end
  # 
  #     it "redirects to the game" do
  #       Game.stub(:find).and_return(mock_game(:update_attributes => true))
  #       put :update, :id => "1"
  #       response.should redirect_to(game_url(mock_game))
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "updates the requested game" do
  #       Game.should_receive(:find).with("37").and_return(mock_game)
  #       mock_game.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :game => {:these => 'params'}
  #     end
  # 
  #     it "assigns the game as @game" do
  #       Game.stub(:find).and_return(mock_game(:update_attributes => false))
  #       put :update, :id => "1"
  #       assigns[:game].should equal(mock_game)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       Game.stub(:find).and_return(mock_game(:update_attributes => false))
  #       put :update, :id => "1"
  #       response.should render_template('edit')
  #     end
  #   end
  # 
  # end
  # 
  # describe "DELETE destroy" do
  #   it "destroys the requested game" do
  #     Game.should_receive(:find).with("37").and_return(mock_game)
  #     mock_game.should_receive(:destroy)
  #     delete :destroy, :id => "37"
  #   end
  # 
  #   it "redirects to the games list" do
  #     Game.stub(:find).and_return(mock_game(:destroy => true))
  #     delete :destroy, :id => "1"
  #     response.should redirect_to(games_url)
  #   end
  # end

end
