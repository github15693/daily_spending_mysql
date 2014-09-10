require 'socket'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionController::MimeResponds
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_tab
  before_action :get_friend_list
  before_action :total_confirm
  authorize_resource :class=> false

  def total_confirm
    unless current_user.blank?
      @total_confirm = FriendList.where(confirm_user: current_user.id, is_confirm: 0).size > 0 ? FriendList.where(confirm_user: current_user.id, is_confirm: 0).size : 0
    end
  end

  def get_friend_list
    unless current_user.blank?
      temp = FriendList.where("(request_user= #{current_user.id} OR confirm_user = #{current_user.id}) AND is_confirm = #{true}")
      @friend_lists = []
      unless temp.blank?
        temp.each do |t|
          if t.request_user.to_i == current_user.id.to_i
            @friend_lists << User.find(t.confirm_user.to_i)
          else
            @friend_lists << User.find(t.request_user.to_i)
          end
        end
      end
    end
  end

  def set_tab
    # @serverSocket = TCPServer.new('','')
    # @serverSocket.setsockopt(Socket::SDL_Socket, Socket::SO_REUSEADDR, 1)
    session['nav_tab'.to_sym] = controller_name.to_sym
  end

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
