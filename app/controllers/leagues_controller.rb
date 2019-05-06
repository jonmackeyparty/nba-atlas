class LeaguesController < ApplicationController
  before_action :require_login
  before_action :check_cancel, only: [:create, :update]

  def index
    current_user
  end

  def new
    current_user
    @league = League.new(:admin_id => params[:player_id])
  end

  def create
    current_user
    @league = League.new(league_params)
    if @league.save
      redirect_to player_path(@league.admin)
    else
      render 'new'
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
    params.require(:league).permit(:name, :league_type, :schedule, :admin_id)
  end


end
