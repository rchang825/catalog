class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.belongs_to :product
      t.belongs_to :customer
      t.integer :quantity
      t.timestamps
    end
  end
end
