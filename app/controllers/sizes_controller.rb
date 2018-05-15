class SizesController < ApplicationController
before_action :authenticate_admin!
def index
	@sizes = Size.all
	@materials = Material.all
	@tastes = Taste.all
	if params[:size_id].present?
		@size = Size.find(params[:size_id])
		@material = Material.new
		@taste = Taste.new

	elsif params[:taste_id].present?
		@taste = Taste.find(params[:taste_id])
		@size = Size.new
		@material = Material.new

	elsif params[:material_id].present?
		@material = Material.find(params[:material_id])
		@size = Size.new
		@taste = Taste.new
	else
		@size = Size.new
		@taste = Taste.new
		@material = Material.new
	end
end

def create
	@sizes = Size.all
	@material = Material.new
	@materials = Material.all
	@taste = Taste.new
	@tastes = Taste.all
	@size = Size.new(size_params)
	if @size.save
		redirect_to sizes_path
	else
		render :index
	end
end

def update
	@size = Size.find(params[:id])
	@size.update(size_params)
	redirect_to sizes_path
end

def destroy
	@size = Size.find(params[:id])
	@size.destroy
	redirect_to sizes_path
end
private

    def size_params
        params.require(:size).permit(:size_name, :diameter)

    end

end
