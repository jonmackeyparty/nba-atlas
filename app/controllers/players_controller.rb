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

  def edit
    current_user
  end

  def update
    current_user
    @player.update(player_params)
    redirect_to player_path(@player)
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :nickname, :position, :jersey_number, :admin, :password, :password_confirmation)
  end

end
