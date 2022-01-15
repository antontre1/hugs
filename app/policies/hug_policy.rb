class HugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user == record.user
  end

  def destroy?
    record.user == user
  end

end
