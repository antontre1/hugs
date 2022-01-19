class BookingsController < ApplicationController
  def new
    @hug = Hug.find(params[:hug_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @hug = Hug.find(params[:hug_id])
    @booking = Booking.new(booking_params)
    @booking.hug = @hug
    @booking.user_id = current_user.id
    @booking.status = "planned"
    authorize @booking
    if @booking.save
      redirect_to hug_path(@hug)
    else
      render :new
    end
  end

  def index
    @hug = Hug.find(params[:hug_id])
    @bookings = @hug.bookings
    policy_scope(Booking)
  end

  def index_user
    @user = current_user
    @bookings = @user.bookings
    @hugs = @user.hugs
    @hugs.each do |hug|
      puts hug.bookings
    end
    policy_scope(Booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    hug_id = @booking.hug.id
    authorize @booking
    @booking.destroy
    redirect_to hug_path(hug_id)
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :hug_id)
  end
end
