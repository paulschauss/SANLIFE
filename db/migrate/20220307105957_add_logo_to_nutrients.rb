class AddLogoToNutrients < ActiveRecord::Migration[6.1]
  def change
    add_column :nutrients, :logo, :string
  end
end
