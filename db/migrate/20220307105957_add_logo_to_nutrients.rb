class AddLogoToNutrients < ActiveRecord::Migration[6.1]
  def change
    add_column :nutrients, :logo, :string
    add_column :nutrients, :string, :string
  end
end
