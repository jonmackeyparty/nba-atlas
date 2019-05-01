class SessionsController < ApplicationController

  def new
  end

  def create
      session[:name] = params[:name]
    if !logged_in?
      redirect_to '/login'
    else
      redirect_to '/'
    end
  end

  def destroy
    def destroy
    if logged_in?
      session.delete :name
      render 'sessions/new'
    else
      redirect_to '/login'
    end
  end
  end

  def logged_in?
    session[:name] != nil && session[:name] != ""
  end

end
