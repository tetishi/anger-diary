# frozen_string_literal: true

class SuccessRecord < ApplicationRecord
  validates :success_body, presence: true
end
