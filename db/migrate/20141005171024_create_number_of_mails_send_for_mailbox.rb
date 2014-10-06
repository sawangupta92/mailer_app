class CreateNumberOfMailsSendForMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :number_of_mails_send, :integer, :default => 0
  end
end
