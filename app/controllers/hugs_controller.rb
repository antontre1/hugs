class HugsController < ApplicationController
  def index
    @hugs = Hug.all

  end


  def create
    @hug = Hug.new(hug_params)
    @hug.user = current_user
    if @hug.save
      redirect_to hugs_path
    else
      render :new
    end
  end

  def new
    @hug = Hug.new
  end

  private

  def hug_params
    params.require(:hug).permit(:title, :description, :category, :price, :city, :address)

  end

end
