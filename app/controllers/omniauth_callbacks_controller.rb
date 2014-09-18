class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def provider
    user = User.process_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
      # redirect_to '/homes'
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
      # redirect_to '/homes'
    end
  end

  def facebook
    session[:temp] = 12345678
  end

  # alias_method :twitter, :provider
  # alias_method :facebook, :provider

end
