class AddMailboxIdToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :mailbox_id, :integer
  end
end
