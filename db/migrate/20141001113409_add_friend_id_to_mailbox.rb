class AddFriendIdToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :friend_id, :integer
  end
end
