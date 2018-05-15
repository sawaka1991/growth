class AllergiesController < ApplicationController
	before_action :authenticate_admin!

	def create
		@item = Item.find(params[:item_id])
		@allergy = Allergy.new(allergy_params)
		@allergy.item_id = @item.id
		@allergies = @item.allergies
		if @allergies.find_by(material_id: @allergy.material_id).blank?
			@allergy.save
			redirect_to edit_item_path(@allergy.item_id)
		else
			redirect_to edit_item_path(@allergy.item_id), flash: {allergy_error: '登録済みです'}
		end
	end

	def destroy
		@allergy = Allergy.find(params[:id])
		@allergy.destroy
		redirect_to edit_item_path(@allergy.item_id)
	end

	private
		def allergy_params
			params.require(:allergy).permit(:material_id, :item_id, :id)
		end
end
