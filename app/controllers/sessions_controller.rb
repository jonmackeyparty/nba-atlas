class SessionsController < ApplicationController

  def new
  end

  def create
    @player = Player.find_by(name: params[:name])
    return head(:forbidden) unless @player.authenticate(params[:password])
    session[:player_id] = @player.id
  end

  def destroy
    if logged_in?
      session.delete :name
      render 'sessions/new'
    else
      redirect_to '/login'
    end
  end

  def logged_in?
    session[:name] != nil && session[:name] != ""
  end

end
