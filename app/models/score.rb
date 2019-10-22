class Score < ApplicationRecord
  belongs_to :match
  belongs_to :machine
  belongs_to :player
  belongs_to :season
end
