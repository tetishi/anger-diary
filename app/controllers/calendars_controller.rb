# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @anger_records = AngerRecord.all
    @anger_dates = AngerRecord.all.pluck(:got_angry_on).map {|date| date.to_s}

    @success_records = SuccessRecord.all
    @success_dates = @success_records.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).map {|date| date.to_s}.uniq
  end

  def show
    @anger_dates = AngerRecord.all.pluck(:got_angry_on).map {|date| date.to_s}

    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).map {|date| date.to_s}.uniq

    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
  end
end
