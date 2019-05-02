class Invitation < ApplicationRecord
  belongs_to :league
  belongs_to :player
  scope :pending, -> { where(accepted: false) }

  def league_name
    League.find(self.league_id).name
  end

  def admin_name
    Player.find(self.player_id).name
  end

  def created_date
    self.created_at.strftime("%A, %b %d")
  end

end
