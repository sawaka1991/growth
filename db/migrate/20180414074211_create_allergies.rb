class CreateAllergies < ActiveRecord::Migration[5.1]
  def change
    create_table :allergies do |t|
      t.integer :material_id
      t.integer :item_id

      t.timestamps
    end
  end
end
