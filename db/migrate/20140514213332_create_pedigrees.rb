class CreatePedigrees < ActiveRecord::Migration
  def change
    create_table :pedigrees do |t|
      t.string :name

      t.timestamps
    end
  end
end
