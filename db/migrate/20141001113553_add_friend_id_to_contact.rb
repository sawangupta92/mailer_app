class AddFriendIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :friend_id, :integer
  end
end
