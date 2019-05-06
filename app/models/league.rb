class League < ApplicationRecord
  belongs_to :player
  has_many :teams
  has_many :invitations
  has_many :players, through: :invitations
end
