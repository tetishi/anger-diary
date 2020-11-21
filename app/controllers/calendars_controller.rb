# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    # @anger_records = AngerRecord.all
    # @success_records = SuccessRecord.all
    @record_dates = AngerRecord.all && SuccessRecord.all
  end

  def show
    @anger_date = AngerRecord.includes(:level, :got_angry_on).where(got_angry_on: Date.today)
    @success_date = SuccessRecord.where(created_at: now.all_day)
    # redirect_to calendar_path(id: :got_angry_on)
  end
end
