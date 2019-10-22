class Machine < ApplicationRecord
  belongs_to :league
  belongs_to :location

  has_many :machines_matches, inverse_of: :machine
  has_many :scores, inverse_of: :machine
end
