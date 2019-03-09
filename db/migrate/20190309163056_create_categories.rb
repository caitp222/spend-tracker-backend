class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :color_hex, null: false
      t.string :category_type, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
