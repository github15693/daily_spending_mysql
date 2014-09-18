class UsersController < ApplicationController
  ActionController::MimeResponds
  # authorize_resource
  def index
    @users = User.where("email <> \"admin@daily.spending.com\" and id <> #{current_user.id}")
    respond_to do |f|
      f.js
    end
  end

end
