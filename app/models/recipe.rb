class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  validates :name, :category, presence: true

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}

  def self.search(search)
    Recipe.where("name ILIKE ? or category ILIKE ?", "%#{search}%", "%#{search}%")
  end
  # if you write this as scope
  # scope :search, -> (search) {where("name ILIKE ? or category ILIKE ?", "%#{search}%", "%#{search}%")}
  
  # to get record from only one column
   #Recipe.where("name ILIKE ?", "%#{search}%")
  # to get record from only one column(the other way)
   # Recipe.where('name ILIKE :search OR category ILIKE :search', search: "%#{search}%")
end
