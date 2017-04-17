class TransactionsController < ApplicationController
	before_action :set_transaction, only: [:show, :edit, :update, :destroy]
	load_and_authorize_resource

	# GET /transactions
	# GET /transactions.json
	def index
		@transactions = Transaction.all
	end

	# GET /transactions/1
	# GET /transactions/1.json
	def show
	end

	# GET /transactions/new
	def new
		@transaction = Transaction.new
	end

	# GET /transactions/1/edit
	def edit
	end

	# POST /transactions
	# POST /transactions.json
	def create
		@transaction = Transaction.new(transaction_params)

		if (@transaction.transaction_type = true)
			i.user_id = nil
			i.checked_out = false
			i.save
		else
			i.user_id = @transaction.user_id
			i.checked_out = true
			i.save
		end
		@transaction.user = current_user
		respond_to do |format|
			if @transaction.save
				format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
				format.json { render :show, status: :created, location: @transaction }
			else
				format.html { render :new }
				format.json { render json: @transaction.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /transactions/1
	# PATCH/PUT /transactions/1.json
	def update
		respond_to do |format|
			if @transaction.update(transaction_params)
				format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
				format.json { render :show, status: :ok, location: @transaction }
			else
				format.html { render :edit }
				format.json { render json: @transaction.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /transactions/1
	# DELETE /transactions/1.json
	def destroy
		@transaction.destroy
		respond_to do |format|
			format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def check_in
	end

	def check_out
		@transaction = Transaction.new

		# noinspection RubyAssignmentExpressionInConditionalInspection
		if match = params[:iid].match(/([A-Za-z]{3})\s*0*(\d+)/i)
			item_code, itemid = match.captures
		else
			raise Error('Bad item ID')
		end
		puts item_code, itemid

		itemtype = ItemType.find_by! code: item_code.upcase

		item = Item.find_by! item_type: itemtype, inst_num: itemid.to_i

		@transaction.item_id = item.id
		@transaction.user_id = current_user.id
		@transaction.transaction_type = false
		@transaction.save

		item.user_id = current_user.id
		item.checked_out = true
		item.save

		flash[:notice] = item.full_id + ' successfully checked out.'

		redirect_to root_path
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_transaction
			@transaction = Transaction.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def transaction_params
			params.require(:transaction).permit(:transaction_type, :item_id, :user_id, :notes, :loan_time, :iid)
		end
end
