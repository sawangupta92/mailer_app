class CreateTableReciever < ActiveRecord::Migration
  def change
    create_table :recievers do |t|
      t.belongs_to :email
      t.belongs_to :mailbox
      t.timestamps
    end
  end
end
