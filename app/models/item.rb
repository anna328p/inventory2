class Item < ApplicationRecord
  belongs_to :item_type
	def type_name
		self.item_type.name
	end
	def full_id
		self.item_type.code + ' ' + self.inst_num.to_s
	end
end
