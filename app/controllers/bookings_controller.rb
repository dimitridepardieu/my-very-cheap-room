class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room_id = params[:room_id]

    if @booking.save
      redirect_to room_path(@booking.room)
      flash[:notice] = "Your booking is now confirmed"
    else
      render room_path(@booking.room), status: :unprocessable_entity
      flash[:alert] = "Your booking could not be registered"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
