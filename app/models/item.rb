class Item < ApplicationRecord
  belongs_to :item_type
	def type_name
		ItemType.find(self.item_type_id).name
	end
end
