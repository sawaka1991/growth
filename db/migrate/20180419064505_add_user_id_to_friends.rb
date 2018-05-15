class AddUserIdToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :user_id, :integer
  end
end
