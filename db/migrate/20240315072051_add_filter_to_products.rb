class AddFilterToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :filter,  foreign_key: true
  end
end
