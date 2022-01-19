class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hugs = policy_scope(Hug.all)
    @markers = @hugs.geocoded.map do |hug|
      {
        lat: hug.latitude,
        lng: hug.longitude,
        info_window: "<p>#{hug.title}</p>"
      }
    end
  end
end
