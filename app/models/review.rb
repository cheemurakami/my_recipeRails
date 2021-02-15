class Review < ApplicationRecord
  belongs_to :recipe
  validates :star, :comment, presence: true
end
