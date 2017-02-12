class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    set_user
    if set_user
  	 @user = User.find_by(id: params[:id])
  	 if current_user.role == 'guest'
  	   redirect_to user_path(current_user)
  	 end
    else
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to root_path
    end
  end

  private

  def set_user
    if User.where(id: params[:id]).present?
      @user = User.find(params[:id])
    else
      return false
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

end
