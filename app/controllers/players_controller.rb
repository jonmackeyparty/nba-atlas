class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.checks_out?
      raise params.inspect
    else
      render '/signup'
    end 
  end

  def destroy
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :nickname, :position, :jersey_number, :password, :password_confirmation)
  end

end
