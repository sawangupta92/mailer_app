class CreateTableEmailMailboxes < ActiveRecord::Migration
  def change
    create_table :emails_mailboxes do |t|
      t.belongs_to :email
      t.belongs_to :mailbox
      t.timestamps
    end
  end
end
