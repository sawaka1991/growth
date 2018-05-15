class FriendsController < ApplicationController

	def index
	 	@friends = Friend.where(user_id: current_user.id)
		@user = User.find(params[:user_id])
		@friend = Friend.new
		@friend.likes.build

	end

	def show
		@friend = Friend.find(params[:id])
		@likes = Like.where(friend_id: @friend.id)
		@memories = Memory.where(friend_id: @friend.id)
		@memory = Memory.new
	end

	def top
		@user = User.find(params[:id])
	 	@friends = Friend.where(user_id: @user.id)
	 	this_month = Time.current.strftime('%Y-%m-%d')
	 	@friend_m = @friends.birthday_month(this_month)
		@friend = Friend.new
		@friend.likes.build
	end

	def create
		@user = current_user
		@friends = Friend.where(user_id: current_user)
	 	@friend = Friend.new(friend_params)
		@friend.likes.build
	 	@friend.user_id = current_user.id
	 	if @friend.save
	 		tastes = params[:friend][:likes_attributes]["0"][:taste_id]
			tastes.each do |taste|
				like = @friend.likes.new
				like.taste_id = taste
				like.save
			end
			redirect_to user_friends_path(current_user.id)
		else
			render :index
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@friend = Friend.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@friend = Friend.find(params[:id])
		if @friend.update(friend_params)
			redirect_to user_friends_path(user_id: current_user.id, id: @friend.id)
		else
			render :edit
		end
	end

	def destroy
		@friend = Friend.find(prams[:id])
		@friend.destroy
		redirect_to user_friends_path(current_user_id)
	end


	private
	def friend_params
		params.require(:friend).permit(:id, :name, :birthday, :image, :group)
	end


end
