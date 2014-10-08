class ChangeAttachmentType < ActiveRecord::Migration
  def change
    change_column :attachments, :type, :string
  end
end
