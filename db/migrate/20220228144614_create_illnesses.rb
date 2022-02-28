class CreateIllnesses < ActiveRecord::Migration[6.1]
  def change
    create_table :illnesses do |t|
      t.string :name

      t.timestamps
    end
  end
end
