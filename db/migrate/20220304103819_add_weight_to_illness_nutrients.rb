class AddWeightToIllnessNutrients < ActiveRecord::Migration[6.1]
  def change
    add_column :illness_nutrients, :weight, :integer
  end
end
