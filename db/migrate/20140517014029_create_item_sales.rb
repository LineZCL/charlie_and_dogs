class CreateItemSales < ActiveRecord::Migration
  def change
    create_table :item_sales do |t|
      t.integer :sale_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
