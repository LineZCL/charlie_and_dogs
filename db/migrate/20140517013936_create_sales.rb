class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.decimal :total_price

      t.timestamps
    end
  end
end
