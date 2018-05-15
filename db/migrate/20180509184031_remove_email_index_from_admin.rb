class RemoveEmailIndexFromAdmin < ActiveRecord::Migration[5.1]
   def up
    remove_index :admins, :email
    add_index :admins, [:email, :soft_destroyed_at], unique: true
  end

  def down
    remove_index :admins, [:email, :soft_destroyed_at]
    add_index :admins, :email, unique: true
  end
end
