class SeasonsScoringRule < ApplicationRecord
  belongs_to :season

  has_many :scoring_rules, inverse_of: :seasons_scoring_rule
end
