class AddTagToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :tag, :string
  end
end
