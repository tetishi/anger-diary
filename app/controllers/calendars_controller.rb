# frozen_string_literal: true

class CalendarsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @anger_dates = current_user.anger_records.pluck(:got_angry_on).map(&:to_s)
    @success_dates = current_user.success_records.pluck(:succeeded_on).map(&:to_s)
    @record_dates = (@anger_dates | @success_dates).uniq
  end

  def show
    @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
      anger_record.got_angry_at.strftime("%k")
    end
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
  end

  def update
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
    # @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
    #   anger_record.got_angry_at.strftime("%k")
    # end
    # # binding.pry

    # @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])

    # # binding.pry
    # if @anger_record.update(anger_record_params)
    #   redirect_to calendar_url(date: @anger_record.got_angry_on), notice: "怒りの記録が編集されました。"
    # else
    #   render :edit
    # end

    if @success_record.update(success_record_params)
      render json: @success_record
    else
      head :bad_request
    end
  end

    private

      # def anger_record_params
      #   # require
      #   params.requier(:anger_record).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      #   # params.permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      #   # params.require(:anger_or_success_data).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      # end

      def success_record_params
        params.permit(:success_body)
      end
end
