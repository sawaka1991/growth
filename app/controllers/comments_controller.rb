class CommentsController < ApplicationController
	before_action :authenticate_admin!

	def create
		@reviews = Review.all
		@comments = Comment.all
		@comment = Comment.new(comment_params)
		@comment.admin_id = current_admin.id
		if @comment.save
			redirect_to reviews_path
		else
			render "reviews/index"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to reviews_path
	end

		private
		def comment_params
			params.require(:comment).permit(:admin_id, :review_id, :body)
		end
end
