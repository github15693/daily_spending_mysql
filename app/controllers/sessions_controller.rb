class SessionsController < Devise::SessionsController
  layout 'blank'

  def create_auth
    @user = User.from_omniauth(env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def destroy_auth
    session[:user_id] = nil
    redirect_to root_url
  end

end
