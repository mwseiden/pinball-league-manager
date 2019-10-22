class League < ApplicationRecord
  has_many :players, inverse_of: :league
  has_many :locations, inverse_of: :league
  has_many :machines, inverse_of: :league
  has_many :seasons, inverse_of: :league
end
