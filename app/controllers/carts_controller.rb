class CartsController < ApplicationController

	def show
		@cart = Cart.find_by(user_id: current_user)
		@cart_item_prices = CartItemPrice.where(cart_id: @cart)
	end

	def reserve
		@user= User.find(current_user[:id])
		@history = @user.histories.new
		@cart = Cart.find_by(user_id: current_user)
		@cart_item_prices = CartItemPrice.where(cart_id: @cart)
	end

	def confirm
		@user = User.find(current_user[:id])
		@cart = Cart.find_by(user_id: @user.id)
		@cart_item_prcies = CartItemPrice.where(cart_id: @cart.id)
		@history = @user.histories.new
		@history = History.new
		@history.item_histories.build
		@name = @user.last_name + @user.first_name
		@date = params[:history][:reserve_date]
		if @date.blank?
			redirect_to reserve_path, flash: {reserve: 'ご予約日を選択してくださいm(._.)m'}
		else
			@time = params[:history][:time]
			@candle = params[:history][:candle]
			@remark = params[:history][:remark]
			@cart = Cart.find_by(user_id: current_user)
			@cart_item_prices = CartItemPrice.where(cart_id: @cart)
		end
	end
end
