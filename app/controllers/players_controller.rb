class PlayersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.checks_out?
      @player.save
      session[:player_id] = @player.id
      flash[:message] = "Profile successfully created."
      redirect_to player_path(@player)
    else
      render 'players/new'
    end
  end

  def destroy
  end

  def show
    current_user
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :nickname, :position, :jersey_number, :admin, :password, :password_confirmation, leagues_attributes: [:name, :league_type, :schedule, :player_id])
  end

  def require_login
    return head(:forbidden) unless session.include? :player_id
  end

end
