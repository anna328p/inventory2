class RemoveItemIdFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :item_id, :integer
  end
end
