class Recipe < ApplicationRecord
  has_many :ingredients, deoendent: :destroy
end
