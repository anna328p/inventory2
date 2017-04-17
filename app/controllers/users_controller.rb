class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		authorize! :manage, @user
	end
	def index
		@users = User.all
		authorize! :manage, @users
	end
end
