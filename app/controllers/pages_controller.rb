class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @hugs = Hug.global_search("%#{params[:query]}%")
    else
      @hugs = policy_scope(Hug.all)
    end
    @markers = @hugs.geocoded.map do |hug|
      {
        lat: hug.latitude,
        lng: hug.longitude,
        info_window: "<p>#{hug.title}</p>"
      }
    end
  end
end
