class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :measurement_qty
      t.references :recipe

      t.timestamps
    end
  end
end
