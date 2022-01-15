class HugsController < ApplicationController
  def index
    @hugs = policy_scope(Hug.all)
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
    @reviews = policy_scope(Review.all)
    #@review_hug = @reviews.map { |review| " #{review.hug_id}='#{@hug.id}'" }
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
    params.require(:hug).permit(:title, :description, :category, :price, :city, :address, :photo)

  end

end
