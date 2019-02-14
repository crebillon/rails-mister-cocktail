class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, allow_blank: false
  validates :ingredient, uniqueness: { scope: :cocktail }
  # validates :cocktail_id, presence: true, allow_blank: false
  # validates :ingredient_id, presence: true, allow_blank: false
end
