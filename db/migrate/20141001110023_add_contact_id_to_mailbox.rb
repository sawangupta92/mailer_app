class AddContactIdToMailbox < ActiveRecord::Migration
  def change
    belongs_to :contacts
  end
end
