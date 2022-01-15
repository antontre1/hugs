class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def index_user?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
