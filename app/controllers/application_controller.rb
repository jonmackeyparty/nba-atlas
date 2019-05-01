class ApplicationController < ActionController::Base

  def current_user
    @player = Player.find(session[:player_id])
  end

  def logged_in?
    session[:player_id] != nil && session[:player_id] != ""
  end

end
