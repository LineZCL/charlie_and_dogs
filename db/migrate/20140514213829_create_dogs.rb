class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :photo
      t.text :description
      t.decimal :price, precision:8, scale:2
      t.integer :pedigree_id

      t.timestamps
    end
  end
end
