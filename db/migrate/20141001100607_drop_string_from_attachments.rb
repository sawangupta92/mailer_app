class DropStringFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :string, :string
  end
end
