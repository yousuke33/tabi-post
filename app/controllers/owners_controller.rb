class OwnersController < ApplicationController
	
	def new
		@user = User.new
		@user.role = "owner"
		@user.owner = Owner.new
	end
	def create
		user_params = params.require(:user).permit(:name,:email,:password,:password_confirmation,:owner)
		@user = User.create(user_params)
		owner_params = params.require(:user).require(:owner).permit(:user_id,:create_at)
		owner_params[:user_id] = @user.id
		@owner = Owner.create(owner_params)

		if @user.save && @owner.save
	    	redirect_to @owner
	    else
	    	render 'new' 
	    end
	end

	def show
	    @owner = Owner.find_by(params[:id])
	    @user = User.find_by(id: @owner.user_id)
	end

end
