class PlayersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.checks_out?
      @player.save
      session[:player_id] = @player.id
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
    current_user
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :nickname, :position, :jersey_number, :admin, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :player_id
  end

end
