class Location < ApplicationRecord
  belongs_to :league

  has_many :machines, inverse_of: :location
  has_many :matches, inverse_of: :location
end
