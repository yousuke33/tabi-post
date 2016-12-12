class OwnersController < ApplicationController
	
	def new
		@user = User.new
		@user.roles = [:owner]
		@user.owner = Owner.new
	end
	def create
		user_params = params.require(:user).permit(:name,:email,:password,:password_confirmation)
		@user = User.create(user_params)
		owner_params = params.require(:user).require(:owner).permit(:user_id,:create_at)
		owner_params[:user_id] = @user.id
		@owner = Owner.create(owner_params)

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

end
