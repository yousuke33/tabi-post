class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show]
	before_action :configure_permitted_parameters, if: :devise_controller?

  def show
  	@user = User.find_by(id: params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

end
