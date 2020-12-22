# frozen_string_literal: true

class CalendarsController < ApplicationController
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

  def edit
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    # @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
    #   anger_record.got_angry_at.strftime("%k")
    # end
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
    # binding.pry
    # @record_date = @anger_record.try(:got_angry_on) || @success_record.try(:succeeded_on)
  end

  def update
    @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
    @success_record = current_user.success_records.find_by(succeeded_on: params[:date])
  end

  # def destroy
  #   @anger_records = current_user.anger_records.where(got_angry_on: params[:date]).sort_by do |anger_record|
  #     anger_record.got_angry_at.strftime("%k")
  #   end
  #   @anger_record = current_user.anger_records.find_by(got_angry_on: params[:date])
  #   @success_record = current_user.success_records.find_by(succeeded_on: params[:date])

  #   if @anger_records.present? && @success_record.present?
  #     # binding.pry
  #     if @anger_record.destroy
  #       redirect_to calendars_url, notice: "怒りの記録が削除されました。"
  #     elsif @success_record.destroy
  #       redirect_to calendars_url, notice: "今日出来たことの記録が削除されました。"
  #     end
  #   elsif @anger_records.present?
  #     @anger_record.destroy
  #     redirect_to calendars_url, notice: "怒りの記録が削除されました。"
  #   elsif @success_record.present?
  #     @success_record.destroy
  #     redirect_to calendars_url, notice: "今日出来たことの記録が削除されました。"
  #   end

  #   # if @anger_record.destroy
  #   #   redirect_to calendars_url, notice: "怒りの記録が削除されました。"
  #   # end
  #   # if @success_record.destroy
  #   #   redirect_to calendars_url, notice: "今日出来たことの記録が削除されました。"
  #   # end
  # end

    private

      def anger_record_params
        params.require(:anger_or_success_data).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
      end

      def success_record_params
        params.require(:anger_or_success_data).permit(:success_body)
      end
end
