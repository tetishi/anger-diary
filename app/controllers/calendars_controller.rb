# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @anger_dates = AngerRecord.all.pluck(:got_angry_on).map { |date| date.to_s }
    @success_dates = SuccessRecord.all.pluck(:succeeded_on).map { |date| date.to_s }

    @record_dates = (@anger_dates | @success_dates).map { |date| date.to_s }.uniq
  end

  def show
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
  end
end
