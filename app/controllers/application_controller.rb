class ApplicationController < ActionController::Base

  private
  
  def current_user
    @player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  def logged_in?
    session[:player_id] != nil && session[:player_id] != ""
  end

end
