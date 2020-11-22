# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    # binding.pry
    # @anger_records = AngerRecord.all
    # @success_records = SuccessRecord.all
    # @record_dates = AngerRecord.all && SuccessRecord.all
    @anger_records = AngerRecord.where(got_angry_on: AngerRecord.all.pluck(:got_angry_on).map(&:to_date))
    @anger_dates = @anger_records.pluck(:got_angry_on).map {|date| date.to_s}
    @anger_date = @anger_dates.last

    # @success_records = SuccessRecord.where(created_at: SuccessRecord.all.pluck(:created_at).map(&:to_date))
    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}
    @success_date = @success_dates.last

    all_dates = (@anger_dates | @success_dates).uniq.map {|date| date.to_s}
    @success_records = SuccessRecord.where("created_at between ? and ?", all_dates.first.to_datetime.beginning_of_day, all_dates.last.to_datetime.end_of_day)
  end

  def show
    # binding.pry
    # all_dates = (@success_records).uniq.map {|date| date.to_s}
    @anger_records = AngerRecord.where(got_angry_on: AngerRecord.all.pluck(:got_angry_on))
   
    # @anger_dates = @anger_date.uniq.map {|date| date.to_s}
    
    @anger_dates = @anger_records.pluck(:got_angry_on).map {|date| date.to_s}

    

    @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    @success_dates = @success_dates.uniq.map {|date| date.to_s}

    all_dates = (@anger_dates | @success_dates).uniq.map {|date| date.to_s}
    @success_records = SuccessRecord.where("created_at between ? and ?", all_dates.first.to_datetime.beginning_of_day, all_dates.last.to_datetime.end_of_day)
    # @anger_record = AngerRecord.find(params[:date])
    
    # @anger_level = @anger_dates.pluck()
    # @success_dates = SuccessRecord.where(created_at: Time.current.all_day)
    
    # @success_dates = SuccessRecord.where(created_at: SuccessRecord.all.pluck(:created_at).map(&:to_date))
    # @success_date = SuccessRecord.all.pluck(:created_at).map(&:to_date)

    # @success_date = @success_date.uniq.map{|date| date.to_s}
    # # all_dates = (@anger_date | @success_date).uniq.map{|date| date.to_s}
    # @success_date = SuccessRecord.where("created_at between ? and ?", all_dates.first.to_datetime.beginning_of_day, all_dates.last.to_datetime.end_of_day)
  end
end
