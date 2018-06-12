class ItemsController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]

	def index
		# @items = Item.all
		@item_images = ItemImage.all
		@sell = Item.where(status: 0)
		@q = @sell.search(params[:q])
    	@items = @q.result(distinct: true)
    	@all_items = Item.all
    	@qu = @sell.ransack(params[:q])
			if params[:q].present?
				@sell= @qu.result
			else
				@sell= @sell.all
			end
	end

	def search
		@q = Item.ransack(params[:q])
			if params[:q].present?
				@searches = @q.result
			else
				@searches = Item.where(status: 0)
			end

	end

	def top
		@informations = Information.all

	end

	def show
		@item = Item.find(params[:id])
		@cart_item_price = CartItemPrice.new
	end

	def new
		@item = Item.new
		@item.item_images.build
		@item.allergies.build
		@item.item_prices.build
		@item.item_tastes.build

	end

	def earn
		@items = Item.all
		@item_histories = ItemHistory.all
		
	end

	def create
		@items = Item.all
		@item = Item.new(item_params)
		if @item.save
			if params[:item][:item_tastes_attributes].present?
				tastes = params[:item][:item_tastes_attributes]["0"][:taste_id]
				tastes.each do |taste|
					item_taste = @item.item_tastes.new
					item_taste.taste_id = taste
					item_taste.save
				end
			end
			if params[:item][:allergies_attributes].present?
				materials =  params[:item][:allergies_attributes]["0"][:material_id]
				materials.each do |material|
					allergy = @item.allergies.new
					allergy.material_id = material
					allergy.save
				end
			end

			Size.all.each_with_index do |size, i|
				item_price = @item.item_prices.new
				size = params[:item][:item_prices_attributes]["#{i}"][:size_id]
				price = params[:item][:item_prices_attributes]["#{i}"][:price]
				unless price.blank?
					item_price.size_id = size
					item_price.price = price
					item_price.save
				end
			end

			redirect_to items_path
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
		if params[:item_price_id].present?
			@item_price = ItemPrice.find(params[:item_price_id])
			@item_taste = ItemTaste.new
			@allergy = Allergy.new
			@item_prices = ItemPrice.where(item_id: @item.id)
			@item_tastes = ItemTaste.where(item_id: @item.id)
			@allergies = Allergy.where(item_id: @item.id)
		else
			@item_price = ItemPrice.new
			@item_taste = ItemTaste.new
			@allergy = Allergy.new
			@item_prices = ItemPrice.where(item_id: @item.id)
			@item_tastes = ItemTaste.where(item_id: @item.id)
			@allergies = Allergy.where(item_id: @item.id)
		end
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to edit_item_path(@item)
	end

private

    def item_params
        params.require(:item).permit(
        				:id,
        				:item_name,
        				:introduction,
        				:type,
        				:status,
        				item_images_images: []
		        		)
    end
    def search_params
	    params.require(:q).permit!
	end



end
#,        				item_images_attributes: [:id, :item_id, :image_id]