ActionController::Routing::Routes.draw do |map|
  map.home '/', :controller => :games, :action => :index
  map.recent '/recent.:format', :controller => :games, :action => :index
    
  map.resources :games
end
