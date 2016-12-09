class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if current_user && current_user.user?
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        current_user.orders.new
      end
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.admin?
	    "/admin"
	  else
	  	request.env['omniauth.origin'] || stored_location_for(resource) || root_path
	  end
  end
end
