class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index_user?
    true
  end

  def destroy_ajax?
	  true
  end
end
