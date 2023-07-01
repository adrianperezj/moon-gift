class GiftPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    true
  end
  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.event.user == user
  end

  def destroy?
    record.event.user == user
  end
end
