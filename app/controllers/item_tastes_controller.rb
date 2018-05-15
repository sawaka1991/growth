class ItemTastesController < ApplicationController
	before_action :authenticate_admin!

	def create
		@item = Item.find(params[:item_id])
		@item_taste = ItemTaste.new(item_taste_params)
		@item_taste.item_id = @item.id
		@item_tastes = @item.item_tastes
		if @item_tastes.find_by(taste_id: @item_taste.taste_id).blank?
			@item_taste.save
			redirect_to edit_item_path(@item_taste.item_id)
		else
			redirect_to edit_item_path(@item_taste.item_id), flash: {taste_error: '登録済みです'}
		end
	end

	def destroy
		@item_taste = ItemTaste.find(params[:id])
		@item_taste.destroy
		redirect_to edit_item_path(@item_taste.item_id)
	end

	private
		def item_taste_params
			params.require(:item_taste).permit(:item_id, :taste_id, :id)
		end
end
