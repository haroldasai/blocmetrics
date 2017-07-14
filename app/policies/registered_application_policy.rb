class RegisteredApplicationPolicy < ApplicationPolicy
  
  def show?
    user.present? && user == record.user
  end

  def create?
  	user.present?
  end

  def new?
  	user.present?
  end

  def edit?
  	user.present? && user == record.user
  end

  def update?
  	user.present? && user == record.user
  end

  def destroy?
  	user.present? && user == record.user
  end

end  