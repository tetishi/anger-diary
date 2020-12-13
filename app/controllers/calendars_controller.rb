# frozen_string_literal: true

class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @anger_dates = current_user.anger_records.pluck(:got_angry_on).map(&:to_s)
    @success_dates = current_user.success_records.pluck(:succeeded_on).map(&:to_s)
    @record_dates = (@anger_dates | @success_dates).uniq
  end

  def show
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
  end

  def edit
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
    @record_date = @anger_record.try(:got_angry_on) || @success_record.try(:succeeded_on)
  end

  def update
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

    if @anger_record.update(anger_record_params) && @success_record.update(success_record_params)
      redirect_to calendar_url, notice: "怒りと今日出来たことの記録が編集されました。"
    else
      redirect_to :edit
    end
  end

  def destroy
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

    if @anger_record && @success_record
      @anger_record.destroy && @success_record.destroy
      redirect_to calendars_url, notice: "怒りと今日出来たことの記録が削除されました。"
    elsif @anger_record
      @anger_record.destroy
      redirect_to calendars_url, notice: "怒りの記録が削除されました。"
    elsif @success_record
      @success_record.destroy
      redirect_to calendars_url, notice: "今日出来たことの記録が削除されました。"
    end
  end

    private

      def anger_record_params
        params.require(:anger_or_success_data).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      end

      def success_record_params
        params.require(:anger_or_success_data).permit(:success_body)
      end
end
