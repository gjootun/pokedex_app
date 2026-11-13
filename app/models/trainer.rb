# A fake trainer generated with the Faker gem.
class Trainer < ApplicationRecord
  # One-to-many: a trainer has many team members
  has_many :team_members, dependent: :destroy
  # Many-to-many: a trainer's team is made of Pokémon (via team_members)
  has_many :pokemons, through: :team_members

  validates :name, presence: true
  validates :hometown, presence: true
end
