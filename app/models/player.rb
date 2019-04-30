class Player < ApplicationRecord
  has_many :teams, through: :leagues
  has_many :leagues, through: :invitations
  has_many :invitations
end
