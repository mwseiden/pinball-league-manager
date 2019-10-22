# Pre-calculated scores
class PlayersScore < ApplicationRecord
  belongs_to :season
  belongs_to :player
  belongs_to :division
end
