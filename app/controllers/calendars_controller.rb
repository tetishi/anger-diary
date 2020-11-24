# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    @anger_records = AngerRecord.all
    # @anger_records = AngerRecord.where(got_angry_on: AngerRecord.all.pluck(:got_angry_on).map(&:to_date))
    @anger_dates = @anger_records.pluck(:got_angry_on).map {|date| date.to_s}
    # @anger_record = @anger_records.last


    # @anger_calendars = AngerRecord.where(got_angry_on: date)
    # @success_calendars = SuccessRecord.where("created_at between ? and ?", date.beginning_of_day, date.end_of_day)
    # @record_calendars = (@anger_calendars | @success_calendars).uniq


    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).uniq.map {|date| date.to_s}
    # @success_records = SuccessRecord.where("created_at between ? and ?", all_dates.first.to_datetime.beginning_of_day, all_dates.last.to_datetime.end_of_day)
    @success_records = SuccessRecord.all
  end

  def show
    # binding.pry
    # @anger_records = AngerRecord.all.sort do |a, b|
    #   a[:got_angry_on] <=> b[:got_angry_on]
    # end

    # @anger_dates = @anger_date.uniq.map {|date| date.to_s}
    @anger_records = AngerRecord.all
    @anger_dates = @anger_records.pluck(:got_angry_on).map {|date| date.to_s}


    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    @record_dates = (@anger_dates | @success_dates).uniq.map {|date| date.to_s}
    # @success_records = SuccessRecord.where("created_at between ? and ?", all_dates.first.to_datetime.beginning_of_day, all_dates.last.to_datetime.end_of_day)
    @success_records = SuccessRecord.all
  end
end
