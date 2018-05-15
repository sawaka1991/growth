class AdminsController < ApplicationController
	before_action :authenticate_admin!, only: [:index]

	def index
		@admins = Admin.all
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		admin = Admin.find(params[:id])
		admin.soft_destroy
		redirect_to admins_path
	end

	def user_restore
		@user = User.find(params[:id])
		@user.restore
		redirect_to admin_path(@user)
	end

	def admin_restore
		@admin = Admin.find(params[:id])
		@admin.restore
		redirect_to admins_path
	end
end
