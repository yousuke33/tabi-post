class GuestsController < ApplicationController

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
      redirect_to @user
    else
      render 'new' 
    end
  end

  def show
    @guest = Guest.find_by(params[:id])
    @user = User.find_by(id: @guest.user_id)
    @plan = Plan.where(user_id: @guest.user_id)
  end 

  private

  def user_params
    user_params = params.require(:user).permit(:name, :email,:password,:password_confirmation)
    user_params[:role] = "guest"
    return user_params
  end
  def guest_params
    guest_params = params.require(:user).permit(:user_id, :create_at)
    guest_params[:user_id] = @user.id
    return guest_params
  end
end
