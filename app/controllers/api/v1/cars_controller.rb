class Api::V1::CarsController < ApplicationController
  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  private

  def car_params
    params.require(:car).permit(:name, :description, :photo, :price_per_day, :car_model)
  end
end
