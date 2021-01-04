# frozen_string_literal: true

class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @anger_dates = current_user.anger_records.pluck(:got_angry_on).map(&:to_s)
    @success_dates = current_user.success_records.pluck(:succeeded_on).map(&:to_s)
    @record_dates = (@anger_dates | @success_dates).uniq

    # @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
    #   anger_record.got_angry_at.strftime("%k")
    # end

    # @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    # @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

    @anger_records = current_user.anger_records
    # binding.pry
    respond_to do |format|
      format.html
      # format.json {render :json => {hello: "World"}.to_json}
      format.json {render :json => @anger_records.to_json}
    end
  end

  # def indexjosn
  # end

  def show
    @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
      anger_record.got_angry_at.strftime("%k")
    end
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
  end

    private

      def anger_record_params
        params.require(:anger_or_success_data).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      end

      def success_record_params
        params.require(:anger_or_success_data).permit(:success_body)
      end
end
