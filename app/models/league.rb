class League < ApplicationRecord
  belongs_to :player
  has_many :teams
  has_many :players, through: :invitations
  has_many :invitations
end
