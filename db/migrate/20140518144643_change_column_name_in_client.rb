class ChangeColumnNameInClient < ActiveRecord::Migration
  def change
    rename_column :clients, :andress, :address
  end
end
