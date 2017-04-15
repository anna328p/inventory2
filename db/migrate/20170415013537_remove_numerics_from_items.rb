class RemoveNumericsFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :item_type_id, :integer
    remove_column :items, :user_id, :integer
  end
end
