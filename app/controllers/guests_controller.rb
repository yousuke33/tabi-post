class GuestsController < ApplicationController
	before_action :set_guest, only: []

  def new
  	@user = User.new
    @user.guest = Guest.new
  end
  
  def create
    user_params = params.require(:user).permit(:name, :email,:password,:password_confirmation)
    user_params[:role] = "guest"
    @user = User.create(user_params)
    guest_params = params.require(:user).require(:guest).permit(:user_id)
    guest_params[:user_id] = @user.id
    @guest = Guest.create(guest_params)

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

  def set_guest
    # @user = User.find(params[:id])
  end

end
