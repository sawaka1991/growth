class AsksController < ApplicationController
	before_action :authenticate_admin!, only: [:index, :update,]


	def confirm
		@ask = Ask.new
		@about = params[:ask][:about]
		@reply = params[:ask][:reply]
		@name  = params[:ask][:name]
		@email = params[:ask][:email]
		@body = params[:ask][:body]
	end

	def new
		@ask = Ask.new
	end

	def create
		@ask = Ask.new(ask_params)
		@ask.save
		sleep 5
		redirect_to root_path
	end

	def index
		@asks = Ask.all
		@ask = Ask.new
	end

	def update
		@ask = Ask.find(params[:id])
		@ask.update(ask_params)
		redirect_to asks_path
	end

	private
	def ask_params
		params.require(:ask).permit(:name, :about, :id, :email, :body, :reply, :ask, :status)
	end
end
