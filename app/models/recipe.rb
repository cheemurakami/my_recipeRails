class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  validates :name, :category, presence: true

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}
end
