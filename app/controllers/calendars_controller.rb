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

    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    # @anger_record = current_user.anger_records.find_by(got_angry_on: params[:id])

    # nilなのはparams[:date]がないから
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

    @records = current_user.anger_records
    # if params[:date].present?
    #   binding.pry
    # end
    # pryが発動すればparams[:date]は存在している
    # binding.pry
    respond_to do |format|
      format.html
      # format.json {render :json => {hello: "World"}.to_json}
      format.json {render json: @anger_records.to_json}
      # format.json {render :json => {:anger_records => @anger_records.to_json,
      #                               :anger_record => @anger_record.to_json}}
    end
  end

  # def indexjosn
  # end
end
