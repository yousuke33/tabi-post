class GuestsController < ApplicationController
	before_action :set_guest, only: []

  def index
    @user = User.find_by(params[:id])
  end

  def new
  	@user = User.new
    #@user.role = 'guest'
    @user.guest = Guest.new
  end
  
  def create
    user_params = params.require(:user).permit(:name, :email,:password,:password_confirmation)
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
    @user = User.find_by(params[:id])
    @guest = Guest.find_by(params[:id])
  end

  private

  def set_guest
    # @user = User.find(params[:id])
  end

end
