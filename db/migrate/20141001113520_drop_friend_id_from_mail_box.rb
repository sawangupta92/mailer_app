class DropFriendIdFromMailBox < ActiveRecord::Migration
  def change
    remove_column :mailboxes, :friend_id, :integer
  end
end
