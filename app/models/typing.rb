# Join table linking a Pokémon to one of its element types.
class Typing < ApplicationRecord
  belongs_to :pokemon
  belongs_to :element_type

  # A Pokémon can't have the same type listed twice
  validates :pokemon_id, uniqueness: { scope: :element_type_id }
  validates :element_type_id, presence: true
end
