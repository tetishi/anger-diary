# frozen_string_literal: true

class Calendar < ApplicationRecord
  has_many :anger_records
  has_many :success_records
end
