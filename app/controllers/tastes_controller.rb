class TastesController < ApplicationController
before_action :authenticate_admin!

def create
	@material = Material.new
	@materials = Material.all
	@tastes = Taste.all
	@size = Size.new
	@sizes = Size.all
	@taste = Taste.new(taste_params)
	if @taste.save
		redirect_to sizes_path
	else
		render "sizes/index"
	end
end

def update
	@taste = Taste.find(params[:id])
	@taste.update(taste_params)
	redirect_to sizes_path
end

def destroy
	@taste = Taste.find(params[:id])
	@taste.destroy
	redirect_to sizes_path
end
private

    def taste_params
        params.require(:taste).permit(:taste_name, :id)

    end


end
