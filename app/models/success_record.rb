# frozen_string_literal: true

class SuccessRecord < ApplicationRecord
  belongs_to :user

  validates :success_body, presence: true
end
