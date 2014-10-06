class AddColumnsToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :reciever_mailbox_id, :integer
    add_column :emails, :sender_mailbox_id, :integer
  end
end
