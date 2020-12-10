# frozen_string_literal: true

class AngerRecord < ApplicationRecord
  belongs_to :user

  validates :level, presence: true
  validates :got_angry_on, presence: true
  validates :got_angry_at, presence: true
  validates :place, presence: true
  validates :anger_body, presence: true
  validates :changeable, presence: true
  validates :important, presence: true
end
