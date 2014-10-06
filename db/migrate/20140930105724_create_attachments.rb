class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :type
      t.string :file_name
      t.string :string
      t.string :content
      t.string :string

      t.timestamps
    end
  end
end
