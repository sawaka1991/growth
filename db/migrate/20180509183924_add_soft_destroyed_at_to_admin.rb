class AddSoftDestroyedAtToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :soft_destroyed_at, :datetime
    add_index :admins, :soft_destroyed_at
  end
end
