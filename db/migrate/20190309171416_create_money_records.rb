class CreateMoneyRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :money_records do |t|
      t.datetime :date, null: false
      t.float :amount, null: false
      t.string :description, null: false
      t.string :record_type, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
