class InvitationsController < ApplicationController

  def new
    current_user
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitations_params)
    if @invitation.save
      redirect_to player_path(current_user)
    else
      redirect_to new_player_invitation_path(current_user)
    end
  end

  private

  def invitations_params
    params.require(:invitation).permit(:player_id, :league_id, :accepted?)
  end

end
