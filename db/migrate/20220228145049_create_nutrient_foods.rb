class CreateNutrientFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :nutrient_foods do |t|
      t.references :food, null: false, foreign_key: true
      t.references :nutrient, null: false, foreign_key: true
      t.integer :measure_value

      t.timestamps
    end
  end
end
