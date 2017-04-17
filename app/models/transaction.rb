class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :user
	def time
		self.created_at.strftime '%D %r'
	end

	def description
		"#{self.item.full_id} checked #{self.transaction_type ? 'in' : 'out'} by #{self.user.name} at #{self.time}"
	end

	def description_for_profile
		"#{self.item.full_id} checked #{self.transaction_type ? 'in' : 'out'} at #{self.time}"
	end
end
