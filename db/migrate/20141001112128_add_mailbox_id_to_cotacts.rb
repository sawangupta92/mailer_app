class AddMailboxIdToCotacts < ActiveRecord::Migration
  def change
    add_column :contacts, :mailbox_id, :integer
  end
end
