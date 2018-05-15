class HistoriesController < ApplicationController

	def create
		@user = User.find(current_user[:id])
		@history = History.new(history_params)
		@history.user_id = current_user.id
		@history.item_histories.each do |itemhistory|
			@history.save
		end
		GrowthMailer.send_when_create(@history).deliver
		@user.cart.cart_item_prices.delete_all
		sleep 3
		redirect_to root_path
	end

	def index
		@histories = History.order("reserve_date asc")
	end

	def update
		@history = History.find(params[:id])
		@history.update(history_params)
		redirect_to histories_path
	end

	private
		def history_params
			params.require(:history).permit(:user_id, :total_price, :status, :reserve_date, :candle, :remark, :time, :id,
											:item_histories_attributes => [:id, :price, :item_price_id, :history_id, :count, :message])
		end
end
