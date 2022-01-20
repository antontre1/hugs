class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = "\
      hugs.description ILIKE :query \
      OR hugs.title ILIKE :query \
      OR users.username ILIKE :query"
      @hugs = Hug.joins(:user).where(sql_query, query: "%#{params[:query]}%")
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
