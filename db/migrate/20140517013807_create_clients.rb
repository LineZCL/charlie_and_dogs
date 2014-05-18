class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :andress

      t.timestamps
    end
  end
end
