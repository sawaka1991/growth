class MemoriesController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@friend = Friend.find(params[:friend_id])
		@memory = Memory.new(memory_params)
		@memories = Memory.all
		@memory.friend_id = @friend.id
		@likes = @friend.likes
		if @memory.save
			redirect_to user_friend_path(user_id: current_user.id, id: @friend.id)
		else
			render "friends/show"
		end
	end

	def update
		@user = User.find(params[:user_id])
		@friend = Friend.find(params[:friend_id])
		@memory = Memory.find(params[:id])
		@memory.update
		redirect_to user_friend_path(user_id: current_user.id, id: @friend.id)
	end

	def destroy
		@user = User.find(params[:user_id])
		@friend = Friend.find(params[:friend_id])
		@memory = Memory.find(params[:id])
		@memory.destroy
		redirect_to user_friend_path(user_id: current_user.id, id: @friend.id)
	end

	private
	def memory_params
		params.require(:memory).permit(:id, :image, :body, :title)
		
	end
end
