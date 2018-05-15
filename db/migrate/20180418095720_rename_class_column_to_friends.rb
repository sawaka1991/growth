class RenameClassColumnToFriends < ActiveRecord::Migration[5.1]
  def change
  	rename_column :friends, :class, :group
  end
end
