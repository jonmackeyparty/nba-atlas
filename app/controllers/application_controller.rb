class ApplicationController < ActionController::Base

  def current_user
    @player = Player.find(session[:id])
  end
  
end
