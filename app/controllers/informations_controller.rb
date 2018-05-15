class InformationsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@informations = Information.all
		if params[:id].present?
			@information = Information.find(params[:id])
		else
			@information = Information.new
		end
	end

	def create
		@informations = Information.all
		@information = Information.new(information_params)
		if @information.save
			redirect_to informations_path
		else
			render :index
		end
	end

	def update
		@information = Information.find(params[:id])
		@information.update(information_params)
		redirect_to informations_path
	end

	def destroy
		@information = Information.find(params[:id])
		@information.destroy
		redirect_to informations_path
	end

	private

	def information_params
		params.require(:information).permit(:title, :body, :image)
	end
end
