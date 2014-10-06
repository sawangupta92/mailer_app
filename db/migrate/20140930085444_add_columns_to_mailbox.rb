class AddColumnsToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :email, :string
    add_column :mailboxes, :first_name, :string
    add_column :mailboxes, :last_name, :string
  end
end
