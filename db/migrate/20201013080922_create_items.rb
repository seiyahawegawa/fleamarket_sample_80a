class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, foreign_key: true
      t.string :item_name, null: false
      t.text :item_description, null: false
      t.integer :category_id, null: false
      t.integer :conditon_id, null: false
      t.integer :shopping_charges_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_to_delivery, null: false
    end
  end
end
