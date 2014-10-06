class AddMaxToEmail < ActiveRecord::Migration

  def change
    add_column :emails, :max, :integer, :default => 4
  end

end
