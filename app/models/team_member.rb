# Join table: one Pokémon on one trainer's team, with a nickname and level.
class TeamMember < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokemon

  validates :nickname, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 100 }
end
