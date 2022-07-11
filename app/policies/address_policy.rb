class AddressPolicy < ApplicationPolicy
  def update?
    user.present? && record.user.id.eql?(user.id)
  end
end
