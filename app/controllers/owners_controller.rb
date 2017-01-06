class OwnersController < ApplicationController
  
  def new
    @user = User.new
    @user.owner = Owner.new
  end
  
  def create
    User.transaction do
      @user = User.create(user_params)
      @owner = Owner.create(owner_params)
    end
    if @user && @owner
        redirect_to @user
      else
        render 'new' 
      end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    @owner.update(address_params)
    redirect_to user_path
  end

  def show
      @owner = Owner.find(params[:id])
      @user = User.find_by(id: @owner.user_id)
  end

  private

  def user_params
    user_params = params.require(:user).permit(:name,:email,:password,:password_confirmation,:address_zipcode,:address_prefecture_name,:address_city,:address_street)
    user_params[:role] = "owner"
    return user_params
  end
  def  owner_params
     owner_params = params.require(:user).permit(:user_id, :create_at,:address_zipcode,:address_prefecture_name,:address_city,:address_street)
     owner_params[:user_id] = @user.id
    return owner_params
  end
  def address_params
    address_params = params.require(:owner).permit(:user_id, :create_at,:address_zipcode,:address_prefecture_name,:address_city,:address_street)
  end
end
