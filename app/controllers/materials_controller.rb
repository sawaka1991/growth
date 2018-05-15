class MaterialsController < ApplicationController
	before_action :authenticate_admin!

def create
	@taste = Taste.new
	@tastes = Taste.all
	@size = Size.new
	@sizes = Size.all
	@materials = Material.all
	@material = Material.new(material_params)
	if @material.save
		redirect_to sizes_path
	else
		render "sizes/index"
	end
end

def update
	@material = Material.find(params[:id])
	@material.update(material_params)
	redirect_to sizes_path
end

def destroy
	@material = Material.find(params[:id])
	@material.destroy
	redirect_to sizes_path
end
private

    def material_params
        params.require(:material).permit(:material_name)

    end

end
