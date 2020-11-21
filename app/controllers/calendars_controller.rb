# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    # @anger_records = AngerRecord.all
    # @success_records = SuccessRecord.all
    @record_dates = AngerRecord.all && SuccessRecord.all
  end

  def show
    # @got_angry_on = AngerRecord.find(params[:got_angry_on])
    # @record_date = AngerRecord.where(got_angry_on: @got_angry_on)
    @record_date = AngerRecord.where(got_angry_on: Date.today)
    # redirect_to calendar_path(id: :got_angry_on)
  end
end
