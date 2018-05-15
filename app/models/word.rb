class Word < ApplicationRecord
  belongs_to :level
  has_many :guests
end
