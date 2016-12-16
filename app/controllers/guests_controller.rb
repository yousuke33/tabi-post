class GuestsController < ApplicationController
	before_action :set_guest, only: []

  def new
  	@user = User.new
    @user.guest = Guest.new
  end
  
  def create
    User.transaction do
      @user = User.create(user_params)
      @guest = Guest.create(guest_params)
    end
    if @user.save && @guest.save
      redirect_to @guest
    else
      render 'new' 
    end
  end

  def show
    @guest = Guest.find_by(params[:id])
    @user = User.find_by(id: @guest.user_id)
  end 

  private

  def user_params
    user_param = params.require(:user).permit(:name, :email,:password,:password_confirmation)
    user_param[:role] = "guest"
    user_param
  end
  def guest_params
    guest_param = params.require(:user).require(:guest).permit(:user_id)
    guest_param[:user_id] = @user.id
    return guest_param
  end
end
