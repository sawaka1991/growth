class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :introduction
      t.integer :type, null: false

      t.timestamps
    end
  end
end
