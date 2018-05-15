class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :status, default: 0, null: false
      t.date :reserve_date
      t.integer :candle
      t.text :remark
      t.integer :time, null: false

      t.timestamps
    end
  end
end
