class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: { message: 'cannot create an ingredient without a name' }, uniqueness: { message: 'ingredient already exists' }

  before_validation :titleize_name

  def self.sorted
    all.sort_by(&:name)
  end

  private

  def titleize_name
    # only titleizes name if name exists, if name doesn't exist --
    # it doesn't matter because the validation will catch it
    self.name = name&.titleize
  end
end
