class Player < ApplicationRecord
  belongs_to :user
  belongs_to :league

  has_many :players_divisions, inverse_of: :player
  has_many :players_matches, inverse_of: :player
  has_many :players_scores, inverse_of: :player
  has_many :scores, inverse_of: :player
end
