# An element type (fire, water, ...) from the PokeAPI /type endpoint.
# Named ElementType because "type" is a reserved column name in Rails.
class ElementType < ApplicationRecord
  # Many-to-many with Pokemon through the typings join table
  has_many :typings, dependent: :destroy
  has_many :pokemons, through: :typings

  validates :name, presence: true, uniqueness: true
  validates :name, length: { maximum: 30 }
end
