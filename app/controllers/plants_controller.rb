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

  # def update
  #   plant = find_plant
  #   # plant.update(plant_params)
  #   plant.update(find_plant)
  #   render json: plant  
  # end

  def update
    plant = Plant.find_by(id: params[:id])
    if plant 
      # update
      plant.update(plant_params)
      render json: plant
    else
      render json:{error: "Plant not found"}, status: :not_found
    end
  end

  # DELETE /plants/:id
  def destroy
    # find
    plant = Plant.find_by(id: params[:id])
    if plant
      plant.destroy
      head :no_content
    else
      render json:{error: "Plant not found"}, status: :not_found
    end
  end



  # PATCH /birds/:id/like
  # def add_in_stock
  #   plant = find_plant
  #   plant.update(find_plant)
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

 
end
