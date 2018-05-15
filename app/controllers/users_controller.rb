class UsersController < ApplicationController

	def show
		@user = User.find_by(id: current_user)
		@friend = Friend.new
		@friend.likes.build
	end

	def memory
		@user = User.find_by(id: current_user)
		@friend = Friend.new
		@friend.likes.build
		@memories = @user.memories.all
		@friends = Friend.where(user_id: current_user)
	end

	def history
		@user = User.find_by(id: current_user)
		@friend = Friend.new
		@friend.likes.build
		@histories = History.where(user_id: @user).order("created_at desc")
		# binding.pry
	end

	def leave
		@user = User.find_by(id: current_user)
		@friend = Friend.new
		@friend.likes.build
	end


	def destroy
		user = User.find(params[:id])
		user.soft_destroy
		if admin_signed_in?
			redirect_to admins_path
		else
			redirect_to destroy_user_session_path
		end
	end

	def search_params
	  params.require(:q).permit!
	end	
end
