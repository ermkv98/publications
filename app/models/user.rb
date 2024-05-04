# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  enum :role, {
    user: 0,
    admin: 1
  }

  def full_name
    "#{second_name} #{first_name} #{third_name}"
  end
end
