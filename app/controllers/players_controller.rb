class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.checks_out?
      @player.save
        if @player.admin
          redirect_to admin_path(@player)
        else
          redirect_to player_path(@player)
        end 
    else
      render 'players/new'
    end
  end

  def destroy
  end

  def show
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :nickname, :position, :jersey_number, :admin, :password, :password_confirmation)
  end

end
