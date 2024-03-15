class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_details
      t.integer :product_price
      t.integer :product_quantity
      t.integer :product_filter

      t.timestamps
    end
  end
end
