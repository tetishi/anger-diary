# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    # @calendars = AngerRecord.all
    @anger_records = AngerRecord.all
    @success_records = SuccessRecord.all
  end

  def show
    # @record_date = AngerRecord.find(params[:id])
    # @record_date = AngerRecord.where(params[:got_angry_on])
    # redirect_to calendar_path(id: :got_angry_on)
  end
end
