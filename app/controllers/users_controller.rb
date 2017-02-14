class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    if set_user
  	   # redirect_to user_path(current_user) if (current_user.role == 'guest' && @user.role == 'guest')
       @user 
    else
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to root_path
    end
    @user
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
