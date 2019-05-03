class LeaguesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    current_user
  end

  def new
    current_user
    @league = League.new(:player_id => params[:player_id])
    #raise params.inspect
  end

  def create
    raise params.inspect
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
