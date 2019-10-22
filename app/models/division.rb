class Division < ApplicationRecord
  belongs_to :season

  has_many :players_divisions, inverse_of: :division
  has_many :players_scores, inverse_of: :division
end
