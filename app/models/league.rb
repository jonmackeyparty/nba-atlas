class League < ApplicationRecord
  belongs_to :admin
  has_many :teams
  has_many :players, through: :invitations
  has_many :invitations
end
