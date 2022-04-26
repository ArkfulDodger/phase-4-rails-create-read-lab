class PlantsController < ApplicationController
  def index
    render json: Plant.all, only: %i[id name image price]
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, only: %i[id name image price]
    else
      render json: { 'error': 'Plant not found' }, status: :not_found
    end
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, only: %i[id name image price], status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
