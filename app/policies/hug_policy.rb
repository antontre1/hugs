class HugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user == record.user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end

end
