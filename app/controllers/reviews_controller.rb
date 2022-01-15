class ReviewsController < ApplicationController

  def index
    @reviews = policy_scope(Review.all)
    @hug = Hug.find(params[:hug_id])
  end

  def create
    @review = Review.new(review_params)
    @hug = Hug.find(params[:hug_id])
    @review.hug_id = @hug.id
    authorize @review
    if @review.save
      redirect_to hug_reviews_path
    else
      render :new
    end
  end

  def new
    @review = Review.new
    @hug = Hug.find(params[:hug_id])
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @hug = Hug.find(params[:hug_id])
    @review.destroy
    authorize @review
    redirect_to hugs_path(@hug)
  end

  def show
    @review = Review.find(params[:id])
    @hug = Hug.find(params[:hug_id])
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :description)

  end


end
