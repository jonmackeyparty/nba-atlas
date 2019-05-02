class SessionsController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.find_by(name: params[:name])
    if @player
      return head(:forbidden) unless @player.authenticate(params[:password])
      session[:player_id] = @player.id
      redirect_to player_path(@player)
    else
      redirect_to '/login'
      flash[:message] = "You must create an account to continue."
    end
  end

  def destroy
    if logged_in?
      session.delete :player_id
      flash[:message] = "You have successfully logged out."
      redirect_to'/login'
    else
      redirect_to '/login'
    end
  end

end
