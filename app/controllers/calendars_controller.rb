# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    @anger_records = AngerRecord.all
    @anger_dates = @anger_records.pluck(:got_angry_on).map {|date| date.to_s}

    @success_records = SuccessRecord.all
    @success_dates = @success_records.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).map {|date| date.to_s}.uniq
  end

  def show
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @anger_dates = AngerRecord.all.pluck(:got_angry_on).map {|date| date.to_s}

    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).map {|date| date.to_s}.uniq
  end
end
