class CreateTeamMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :team_members do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.string :nickname
      t.integer :level

      t.timestamps
    end
  end
end
