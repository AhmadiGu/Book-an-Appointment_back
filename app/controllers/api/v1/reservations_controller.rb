module Api
  module V1
    class ReservationsController < ApiController
      before_action :doorkeeper_authorize!
      before_action :current_user
      respond_to :json

      def index
        if @current_user.nil?
          render json: { error: 'Not Authorized' }, status: :unauthorized
        else
          @reservations = @current_user.reservations
          render json: @reservations
        end
      end 

      def show
        @reservations = Reservation.where(user_id: params[:id])
        render json: { message: 'Showing Reservations', reservations: @reservations }, status: :ok
      end

      def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user = @current_user
        if @reservation.save
          render json: { reservation: @reservation }, status: :created
        else
          render json: { errors: @reservation.errors }, status: :unprocessable_entity
        end
      end 

      private

      def reservation_params
        params.require(:reservation).permit(:date, :item, :city, :duration, :car_id, :user_id)
      end
    end
  end
end