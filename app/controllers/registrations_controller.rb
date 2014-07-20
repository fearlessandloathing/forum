class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

=begin
   def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)


    # custom logic
    if params[:user][:password].present?
      result = resource.update_with_password(params[resource_name])
    else
      puts params[resource_name]
      result = resource.update_without_password(params[resource_name])
    end

    # standart devise behaviour
    if result
      if is_navigational_format?
        if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
          flash_key = :update_needs_confirmation
        end
        set_flash_message :notice, flash_key || :updated
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
=end

  def confirm

  end

  def after_inactive_sign_up_path_for(resource)
    '/users/confirm'
  end


  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :pseudonym, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :pseudonym, :email, :password, :password_confirmation, :current_password)}
  end

end
