class DropContactIdFromMailbox < ActiveRecord::Migration
  def change
    remove_column :mailboxes, :contact_id, :integer
  end
end
