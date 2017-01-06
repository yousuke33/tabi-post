class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if params[:role].present?
      super
    else
      redirect_to root_path
    end
  end

  # POST /resource
  def create
    if params[:user][:role].present?
      super
      if @user.role == 'owner'
        @user.owner = Owner.new(guest_owner_params)
        @user.owner.name = params[:name]
        @user.save
      elsif @user.role == 'guest' 
        @user.guest = Guest.new(guest_owner_params)
        @user.guest.name = params[:name]
        @user.save
      else
        # redirect_to root_path
      end
    else
      redirect_to root_path, alert: 'ログインできませんでした'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  def guest_owner_params
    guest_owner_params = params.require(:user).permit(:created_at)
    guest_owner_params[:name] = params[:name]
    return guest_owner_params
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end