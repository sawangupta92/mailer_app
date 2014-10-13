class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :email_id

      t.timestamps
    end
  end
end
