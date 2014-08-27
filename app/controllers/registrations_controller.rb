class RegistrationsController < Devise::RegistrationsController
  layout 'blank'
  def create
    build_resource(sign_up_params)
    resource_saved = resource.save
    yield resource if block_given?
    respond_to do |format|
      if resource_saved
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          format.html { respond_with resource, location:  after_sign_up_path_for(resource)}#after_sign_up_path_for(resource)
          format.js {}
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource) }
          format.js {}
        end
      else
        clean_up_passwords resource
        format.html { respond_with resource }
        format.js {}
      end

    end
  end

  protected
  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end
end

