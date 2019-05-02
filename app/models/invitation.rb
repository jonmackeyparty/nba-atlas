class Invitation < ApplicationRecord
  belongs_to :league
  belongs_to :player
  scope :pending, -> { where(accepted?: false) }

  def league_name
    League.find(self.league_id).name
  end
  
end
