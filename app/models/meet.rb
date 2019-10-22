class Meet < ApplicationRecord
  belongs_to :season

  has_many :matches, inverse_of: :meet
end
