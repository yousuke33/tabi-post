class ChatRoomsController < ApplicationController
	def index
		@chat_rooms = ChatRoom.all
	end
	def new
		@chat_room = ChatRoom.new
	end
	def create
		@chat_room = current_user.chat_rooms.build(chat_rooms_params)
		if @chat_room.save
			flash[:success] = "チャットルームを追加しました！"
			redirect_to chat_rooms_path
		else
			render 'new'
		end
	end

	private

	def chat_rooms_params 
		params.require(:chat_room).permit(:title)
	end
end
