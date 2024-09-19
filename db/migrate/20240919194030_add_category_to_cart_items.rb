class AddCategoryToCartItems < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_items, :category, :string
  end
end
