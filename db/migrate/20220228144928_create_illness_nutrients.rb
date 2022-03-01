class CreateIllnessNutrients < ActiveRecord::Migration[6.1]
  def change
    create_table :illness_nutrients do |t|
      t.references :nutrient, null: false, foreign_key: true
      t.references :illness, null: false, foreign_key: true

      t.timestamps
    end
  end
end
