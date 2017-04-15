class AddActualThingsToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :item_type, foreign_key: true
    add_reference :items, :user, foreign_key: true
  end
end
