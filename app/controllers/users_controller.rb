class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		authorize! :show, @user
	end
	def index
		@users = User.all
		authorize! :manage, @users
	end
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'Item was successfully updated.' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { redirect_to @user, notice: 'User could not be updated.' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
end
