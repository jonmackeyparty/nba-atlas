class Player < ApplicationRecord
  has_many :teams, through: :leagues
  has_many :leagues, through: :invitations
  has_many :invitations
  has_many :leagues
  has_secure_password

  def checks_out?
    self.password == self.password_confirmation && Player.find_by(:name => self.name) == nil
  end

end
