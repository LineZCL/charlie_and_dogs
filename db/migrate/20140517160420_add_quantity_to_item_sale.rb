class AddQuantityToItemSale < ActiveRecord::Migration
  def change
    add_column :item_sales, :quantity, :integer
  end
end
