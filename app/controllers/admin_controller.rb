class AdminController < ApplicationController
  def index
		authorize! :manage, AdminController
  end
end
