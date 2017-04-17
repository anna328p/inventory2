class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		authorize! :manage, @user
	end
	def list
		@users = User.all
		authorize! :manage, @users
	end
end
