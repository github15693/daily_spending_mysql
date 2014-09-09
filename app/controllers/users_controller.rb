class UsersController < ApplicationController
  ActionController::MimeResponds
  # authorize_resource
  def index
    @users = User.where("username <> \"Administrator\" and id <> #{current_user.id}")
    respond_to do |f|
      f.js
    end
  end

end
