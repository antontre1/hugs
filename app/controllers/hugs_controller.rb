class HugsController < ApplicationController
  def index
    @hugs = Hug.all
  end

end
