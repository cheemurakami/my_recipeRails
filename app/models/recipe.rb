class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, :category, presence: true
end
