class Match < ApplicationRecord
  belongs_to :meet
  belongs_to :location

  has_many :players_matches, inverse_of: :match
  has_many :machines_matches, inverse_of: :match
  has_many :scores, inverse_of: :match
end
