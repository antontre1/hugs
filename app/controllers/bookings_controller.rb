class BookingsController < ApplicationController
  def new
    @hug = Hug.find(params[:hug_id])
    @booking = Booking.new
  end

  def create
    @hug = Hug.find(params[:hug_id])
    @booking = Booking.new(booking_params)
    @booking.hug = @hug
    @booking.user_id = @hug.user_id
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
