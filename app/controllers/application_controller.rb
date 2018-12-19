class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource
    helper_method :current_order

    def current_order
      if session[:order_id]
        Order.find(session[:order_id])
      else
        Order.new
      end
    end
  
    protected
      # Add parameter to devise
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
      end
  
      def layout_by_resource
        if devise_controller?
          "signin"
        else
          "application"
        end
      end
  end
