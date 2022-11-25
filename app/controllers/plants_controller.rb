class PlantsController < ApplicationController

# rescue from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plant
    # plant.update(plant_params)
     plant.update(is_in_stock: bird.is_in_stock = true)

    render json: plant
  # rescue ActiveRecord::RecordNotFound
  #   render_not_found_response
  end


  # PATCH /birds/:id/like
  # def add_in_stock
  #   plant = find_plant
  #   plant.update(is_in_stock: bird.is_in_stock = true)
  #   render json: plant
  # end

   # DELETE /birds/:id
   def destroy
    plant = find_plant
    plant.destroy
    head :no_content
  end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant
    Plant.find(params[:id])
  end

  # def render_not_found_response
  #   render json: { error: "Plant not found" }, status: :not_found
  # end
end
