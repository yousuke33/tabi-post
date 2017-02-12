class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:success] = "チャットルームを作成しました"
      redirect_to @room
    else
      render 'new'
    end
  end

  def show
  	@room = Room.includes(:messages).find(params[:id])
  	@message = Message.new
  end

  private

  def room_params
  	params.require(:room).permit(:title)
  end
end
