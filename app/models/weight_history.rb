class WeightHistory < ApplicationRecord
  belongs_to :user
  has_many :momentum_counts
end
