class LeaguesController < ApplicationController
  before_action :require_login

  def index
    current_user
  end

  def new
    current_user
    @league = League.new(:player_id => params[:player_id])
  end

  def create
    current_user
    @league = League.new(league_params)
    if @league.save
      redirect_to player_path(@league.player)
    else
      redirect_to new_player_league_path(@player)
    end
  end

  def update
    @league = League.find(params[:id])
    @league.update(league_params)
    redirect_to player_path(@league.player)
  end

  def show
    current_user
    @league = League.find(params[:id])
  end

  def edit
    current_user
    @league = League.find(params[:id])
  end

  private

  def league_params
    params.require(:league).permit(:name, :league_type, :schedule, :player_id)
  end


end
