class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, :measurement_qty, presence: true
end
