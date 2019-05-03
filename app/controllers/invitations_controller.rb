class InvitationsController < ApplicationController
  before_action :require_login

  def new
    current_user
    @invitation = Invitation.new
  end

  def create
    if params['commit'] == "Cancel"
      redirect_to player_path(current_user)
    else
      @invitation = Invitation.new(invitations_params)
      if @invitation.save
        flash[:message] = "Invitation successfully sent."
        redirect_to player_path(current_user)
      else
        redirect_to new_player_invitation_path(current_user)
      end
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(invitations_params)
    redirect_to player_path(current_user)
  end

  private

  def invitations_params
    params.require(:invitation).permit(:player_id, :league_id, :accepted)
  end

end
