class SessionsController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    #raise params.inspect
    @player = Player.find_by(name: params[:name])
    if @player
      return head(:forbidden) unless @player.authenticate(params[:password])
      session[:player_id] = @player.id
      redirect_to player_path(@player)
    else
      redirect_to '/login'
      #flash message goes here
    end
  end

  def destroy
    if logged_in?
      session.delete :player_id
      render 'sessions/new'
    else
      redirect_to '/login'
    end
  end

end
