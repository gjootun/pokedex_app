class CreateTypings < ActiveRecord::Migration[8.1]
  def change
    create_table :typings do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :element_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
