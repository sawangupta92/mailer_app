class AddMailboxIdToCotacts < ActiveRecord::Migration
  def change
    belongs_to :mailboxes
  end
end
