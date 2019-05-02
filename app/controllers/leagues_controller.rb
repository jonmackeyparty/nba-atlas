class LeaguesController < ApplicationController

  def new
    @player_admin = Player.find(session[:player_id])
    @league = League.new
  end

  def create

  end

  def show
  end


end
