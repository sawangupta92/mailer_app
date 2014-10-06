class AddContactIdToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :contact_id, :integer
  end
end
