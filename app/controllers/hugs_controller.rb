class HugsController < ApplicationController
  def index
    @hugs = policy_scope(Hug)
    @markers = @hugs.geocoded.map do |hug|
      {
        lat: hug.latitude,
        lng: hug.longitude,
        info_window: "<p>#{hug.title}</p>"
      }
    end
  end

  def create
    @hug = Hug.new(hug_params)
    @hug.user = current_user
    authorize @hug
    if @hug.save
      redirect_to hugs_path
    else
      render :new
    end
  end

  def new
    @hug = Hug.new
    authorize @hug
  end

  def show
    @hug = Hug.find(params[:id])
    @reviews = @hug.reviews
    @bookings = @hug.bookings
    @booking = Booking.new
    # @marker = [{ lat: @hug.latitude, lng: @hug.longitude, info_window: "<p>#{hug.title}</p>"}]
    @markers =
      [{
        lat: @hug.latitude,
        lng: @hug.longitude,
        info_window: "<p>#{@hug.title}</p>"
      }]
    authorize @hug
  end

  def edit
    @hug = Hug.find(params[:id])
    authorize @hug
  end

  def update
    @hug = Hug.find(params[:id])
    @hug.update(hug_params)
    redirect_to hug_path(@hug)
    authorize @hug
  end

  def destroy
    @hug = Hug.find(params[:id])
    @hug.destroy
    authorize @hug
    redirect_to hugs_path
  end

  private

  def hug_params
    params.require(:hug).permit(:title, :description, :category, :price, :address, :photo)
  end

end
