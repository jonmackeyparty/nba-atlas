class InvitationsController < ApplicationController

  def new
    current_user
    @invitation = Invitation.new
  end

  def create
    raise params.inspect
  end

  private

  def invitations_params
    params.require(:invitation).permit(:player_id, :league_id, :accepted?)

end
