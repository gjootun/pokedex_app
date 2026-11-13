class CreateElementTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :element_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
