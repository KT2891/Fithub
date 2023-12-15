# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      respond_to do |format|
        format.json { render json: { errors: [t("log-in-error-message")] }, status: :unprocessable_entity }
        format.html { render 'public/homes/top' }
      end
    end
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
