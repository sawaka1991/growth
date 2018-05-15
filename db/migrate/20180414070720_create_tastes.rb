class CreateTastes < ActiveRecord::Migration[5.1]
  def change
    create_table :tastes do |t|
      t.string :taste_name

      t.timestamps
    end
  end
end
