# frozen_string_literal: true

class PublicationPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.where(status: %i[review accepted denied])
      else
        scope.where(region: user.region, status: %i[draft accepted denied])
      end
    end

    private

    attr_reader :user, :scope
  end
end
