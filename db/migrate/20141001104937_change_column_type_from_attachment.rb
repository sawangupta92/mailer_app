class ChangeColumnTypeFromAttachment < ActiveRecord::Migration
  def change
    change_column :attachments, :type, :string
  end
end
