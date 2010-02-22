ActionController::Routing::Routes.draw do |map|
  map.resources :games
  map.home '/', :controller => :games, :action => :index
end
