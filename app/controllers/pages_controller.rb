class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      # sql_query = "\
      # hugs.description @@ :query \
      # OR hugs.title @@ :query \
      # OR users.username @@ :query"
      # @hugs = Hug.joins(:user).where(sql_query, query: "%#{params[:query]}%")
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
