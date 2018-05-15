class ItemPricesController < ApplicationController
	before_action :authenticate_admin!

	def create
		@item = Item.find(params[:item_id])
		@item_price = ItemPrice.new(item_price_params)
		@item_price.item_id = @item.id
		@item_prices = @item.item_prices
		if @item_prices.find_by(size_id: @item_price.size_id).blank?
			@item_price.save
			redirect_to edit_item_path(@item_price.item_id)
		else
			redirect_to edit_item_path(@item_price.item_id), flash: {price_error: '登録済みです'}
		end
	end

	def destroy
		@item_price = ItemPrice.find(params[:id])
		@item_price.destroy
		redirect_to edit_item_path(@item_price.item_id)
	end

	def update
		@item = Item.find(params[:item_id])
		@item_price = ItemPrice.find(params[:id])
		@item_price.update(item_price_params)
		redirect_to edit_item_path(@item_price.item_id)
	end

	private
		def item_price_params
			params.require(:item_price).permit(:price, :item_id, :size_id, :id)
		end
end
