class LeaguesController < ApplicationController

  def new
    @league = League.new(:player_id => params[:player_id])
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to player_path(@league.player)
    else
      redirect_to new_player_league_path(@player)
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def edit
  end

  private

  def league_params
    params.require(:league).permit(:name, :league_type, :schedule, :player_id)
  end


end
