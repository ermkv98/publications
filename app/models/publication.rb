# frozen_string_literal: true

class Publication < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_rich_text :content

  enum :status, {
    draft: 0,
    review: 1,
    accepted: 2,
    denied: 3
  }
end
