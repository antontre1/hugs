class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hugs = policy_scope(Hug.all)
    @markers = @hugs.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
