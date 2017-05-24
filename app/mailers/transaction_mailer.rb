class TransactionMailer < ApplicationMailer
	def check_out_email(transaction, user)
		@user = user
		@transaction = transaction
		@url = transactions_url(transaction)
		mail to: user.email, subject: "[GE Inventory] You have checked out #{@transaction.item.full_id}"
	end
end
