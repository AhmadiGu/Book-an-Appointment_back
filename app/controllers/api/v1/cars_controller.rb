class Api::V1::CarsController < ApplicationController
  def index
    @cars = Car.all
    render json: @cars
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: car, status: :created
    else
      render json: { errors: car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  private

  def car_params
    params.require(:car).permit(:name, :description, :photo, :price_per_day, :car_model, :duration)
  end
end
