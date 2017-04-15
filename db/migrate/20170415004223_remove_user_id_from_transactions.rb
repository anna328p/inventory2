class RemoveUserIdFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :user_id, :integer
  end
end
