class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :price
      t.references :user, foreign_key: true
      t.integer :send_cost_id
      t.integer :prefecture_id
      t.integer :send_day_id
      t.timestamps
    end
  end
end
