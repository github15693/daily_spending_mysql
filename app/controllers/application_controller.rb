class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  authorize_resource :class => false
  include ActionController::MimeResponds
  include ApplicationHelper

  def after_sign_in_path_for(resource)
    homes_path
  end
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        if current_user.nil? # user is unauthorized because he/she is not logged in
          session[:next] = request.fullpath
          redirect_to new_user_session_path, :alert => "Please log in to continue."
        else
          render :file => "#{Rails.root}/public/422.html", :status => 403, :layout => false
        end
      end

      format.json do

        render json: {status: 403, message: "You are not allowed to access this resource."}, status: :forbidden
      end
      format.js do
        render js: " window.location = '/422.html'"
      end
    end
  end
  # layout :layout_by_resource
  protected
  def layout_by_resource
    if devise_controller?
      if resource_name == :admin
        "devise_admin_application" #admin model will use this layout
      elsif resource_name == :employee
        "devise_employee_application" #employee model will use this
        layout
      else
        "devise_application" #other devise model will use this layout
      end
    else
      "application" #default rails application layout
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :phone, :condo_id, :full_name, :address, :password, :password_confirmation, :remember_me) }
  end
end
