# frozen_string_literal: true

class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @anger_dates = current_user.anger_records.pluck(:got_angry_on).map(&:to_s)
    @success_dates = current_user.success_records.pluck(:succeeded_on).map(&:to_s)
    @record_dates = (@anger_dates | @success_dates).uniq

    @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
      anger_record.got_angry_at.strftime("%k")
    end
    # @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    # @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

    # render json: @anger_records, @success_record
  end

  def show
    @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
      anger_record.got_angry_at.strftime("%k")
    end
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
  end
end
