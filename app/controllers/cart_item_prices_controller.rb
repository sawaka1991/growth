class CartItemPricesController < ApplicationController

	def create
		if Cart.find_by(user_id: current_user.id)
			@cart = Cart.find_by(user_id: current_user.id)
			@item = Item.find(params[:item_id])
			@cart_item_price = CartItemPrice.new(cart_item_price_params)
			@cart_item_price.cart_id = @cart.id
			@cart_item_price.save
			redirect_to cart_path(@cart)
		else
			@cart = Cart.new
			@cart.user_id = current_user.id
			@cart.save
			@item = Item.find(params[:item_id])
			@cart_item_price = CartItemPrice.new(cart_item_price_params)
			@cart_item_price.cart_id = @cart.id
			@cart_item_price.save
			redirect_to cart_path(@cart)
		end
	end

	def update
		@cart = Cart.find_by(user_id: current_user.id)
		@cart_item_price = CartItemPrice.find(params[:item_id])
		@cart_item_price.update(cart_item_price_params)
		redirect_to cart_path(@cart)
	end

	def destroy
		@cart = Cart.find_by(user_id: current_user)
		@cart_item_price = CartItemPrice.find(params[:item_id])
		@cart_item_price.destroy
		redirect_to cart_path(@cart)
	end

	private
		def cart_params
			params.require(:cart).permit(:user_id)
		end
		def cart_item_price_params
			params.require(:cart_item_price).permit(:count, :message, :item_price_id, :cart_id, :id)
		end
end
