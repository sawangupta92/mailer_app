class AddColumnsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :phone_number, :integer
    add_column :contacts, :address, :string
  end
end
