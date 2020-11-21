# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    # @calendars = AngerRecord.all
    @record_dates = AngerRecord.all
    @record_dates = SuccessRecord.all
  end

  def show
    # @record_date = AngerRecord.find(params[:id])
    # @record_date = AngerRecord.joins(:got_angry_on).where( })
    @record_date = AngerRecord.where(got_angry_on: Date.today)
    # @record_date = AngerRecord.new
    # @record_date = AngerRecord.where(:got_angry_on)
    # @record_date = AngerRecord.where(params[:got_angry_on])
    # redirect_to calendar_path(id: :got_angry_on)
  end
end
