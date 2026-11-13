# A single Pokémon pulled from the PokeAPI /pokemon endpoint.
class Pokemon < ApplicationRecord
  # Many-to-many #1: a Pokémon has one or two element types (via the typings join table)
  has_many :typings, dependent: :destroy
  has_many :element_types, through: :typings

  # Many-to-many #2: a Pokémon can be on many trainers' teams (via team_members)
  has_many :team_members, dependent: :destroy
  has_many :trainers, through: :team_members

  # Validations so bad API data never gets saved
  validates :name, presence: true, uniqueness: true
  validates :pokedex_number, presence: true,
                             numericality: { only_integer: true, greater_than: 0 },
                             uniqueness: true

  # Search by name (text) and/or by element type (dropdown).
  # Either argument can be blank, in which case that filter is skipped.
  def self.search(query, element_type_id)
    results = all
    results = results.where("pokemons.name LIKE ?", "%#{query}%") if query.present?
    if element_type_id.present?
      results = results.joins(:typings).where(typings: { element_type_id: element_type_id })
    end
    results
  end
end
