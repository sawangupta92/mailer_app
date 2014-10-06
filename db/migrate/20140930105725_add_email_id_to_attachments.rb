class AddEmailIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :email_id, :integer
  end
end
