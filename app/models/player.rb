class Player < ApplicationRecord
  has_many :teams, through: :leagues
  has_many :leagues, through: :invitations
  has_many :invitations
  has_many :leagues
  accepts_nested_attributes_for :leagues
  has_secure_password


  def checks_out?
    self.password == self.password_confirmation && Player.find_by(:name => self.name) == nil
  end

  def missing_attributes
    age.nil? || nickname.nil? || position.nil? || jersey_number.nil?
  end

end
