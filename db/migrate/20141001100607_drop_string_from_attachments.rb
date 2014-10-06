class DropStringFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :string
  end
end
