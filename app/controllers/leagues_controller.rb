class LeaguesController < ApplicationController

  def new
    #raise params.inspect
    @league = League.new(:player_id => params[:player_id])
  end

  def create
    @league = League.new(league_params)
    @league.player = current_user
    if @league.save
      redirect_to player_path(@league.player)
    else
      redirect_to new_player_league_path(@player)
    end
  end

  def show
  end

  def edit
  end 

  private

  def league_params
    params.require(:league).permit(:name, :league_type, :schedule, :player_id)
  end


end
