class LikesController < ApplicationController

	def index
		@user = current_user
		@friend = Friend.find(params[:friend_id])
		@likes = Like.where(friend_id: @friend.id)
		@like = Like.new
	end

	def destroy
		@friend = Friend.find(params[:friend_id])
		@like = Like.find(params[:id])
		@like.destroy
		redirect_to user_friend_likes_path(user_id: current_user.id, friend_id: @friend.id)
	end

	def create
		@user = current_user
		@friend = Friend.find(params[:friend_id])
		@like = Like.new(like_params)
		@like.friend_id = @friend.id
		@likes = @friend.likes
		if @likes.find_by(taste_id: @like.taste_id).blank?
			 @like.save
			redirect_to user_friend_likes_path(user_id: current_user.id, friend_id: @friend.id)
		else
			redirect_to user_friend_likes_path(user_id: current_user.id, friend_id: @friend.id), flash: {error: '登録済みです'}
		end
	end

	private
		def like_params
			params.require(:like).permit(:id, :taste_id, :friend_id)

		end
end
