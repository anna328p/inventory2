class Item < ApplicationRecord
  belongs_to :item_type
	def type_name
		self.item_type.name
	end
	def full_id
		self.item_type.code + ' ' + self.inst_num.to_s
	end
	def check_in
		@transaction = Transaction.new

		unless self.checked_out
			flash[:notice] = "Error: #{self.full_id} is not checked out."
			@transaction.destroy
			redirect_to root_path
			return
		end

		@transaction.item_id = self.id
		@transaction.user_id = current_user.id
		@transaction.transaction_type = true
		@transaction.save

		self.user_id = nil
		self.checked_out = false
		self.save

		flash[:notice] = self.full_id + ' successfully checked in.'

		redirect_to root_path
	end
	def check_out
		@transaction = Transaction.new

		if self.checked_out
			flash[:notice] = "Error: #{self.full_id} is already checked out."
			@transaction.destroy
			redirect_to root_path
			return
		end

		@transaction.item_id = self.id
		@transaction.user_id = current_user.id
		@transaction.transaction_type = false
		@transaction.save

		TransactionMailer.check_out_email(@transaction, current_user).deliver_later

		self.user_id = current_user.id
		self.checked_out = true
		self.save

		flash[:notice] = self.full_id + ' successfully checked out.'

		redirect_to root_path
	end
end
