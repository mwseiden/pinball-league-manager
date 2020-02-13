class Season < ApplicationRecord
  belongs_to :league

  has_many :divisions, inverse_of: :season
  has_many :players_scores, inverse_of: :season
  has_many :meets, inverse_of: :season
  has_many :scores, inverse_of: :season
  has_many :scoring_rules, inverse_of: :season

end
