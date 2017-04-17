class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden, content_type: 'text/html' }
			format.html { render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false }
			format.js   { head :forbidden, content_type: 'text/html' }
		end
	end
end
