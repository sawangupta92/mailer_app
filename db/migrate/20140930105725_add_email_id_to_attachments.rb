class AddEmailIdToAttachments < ActiveRecord::Migration
  def change
    belongs_to :emails
  end
end
