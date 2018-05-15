class ReviewsController < ApplicationController

	def index
		@reviews = Review.order("created_at desc")
		@comments = Comment.all
		@comment = Comment.new
		
		if params[:id].present?
			@review = Review.find(params[:id])
		else
			@review = Review.new
		end
	end

	def create
		@reviews = Review.all
		@comments = Comment.all
		@comment = Comment.new
		@review = Review.new(review_params)
		if current_user.present?
			@review.user_id = current_user.id
			if @review.save
				redirect_to reviews_path
			else
				render :index
			end
		else
			redirect_to reviews_path, flash: {review: 'レビュー'}
		end
	end

	def update
		@review = Review.find(params[:id])
		@review.update(review_params)
		redirect_to reviews_path
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to reviews_path
	end

	private
		def review_params
			params.require(:review).permit(:user_id, :item_id, :comment, :image)
		end
end
