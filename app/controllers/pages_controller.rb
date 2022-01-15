class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hugs = policy_scope(Hug.all)
  end
end
