# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @anger_dates = AngerRecord.all.pluck(:got_angry_on).map { |date| date.to_s }
    @success_dates = SuccessRecord.all.pluck(:succeeded_on).map { |date| date.to_s }

    @record_dates = (@anger_dates | @success_dates).map { |date| date.to_s }.uniq
  end

  def show
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
  end

  def edit
    binding.pry
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
    if @anger_record.edit
      @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    elsif @success_record.edit
      @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
    end
  end

  def update
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
    if @anger_record.update(anger_record_params)
      redirect_to @anger_record, notice: "怒りの記録が編集されました。"
    elsif @success_record.update(success_record_params)
      redirect_to @success_record, notice: "今日出来たことが編集されました。"
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
    if @anger_record.destroy
      redirect_to calendars_url, notice: "怒りの記録が削除されました。"
    elsif @success_record.destroy
      redirect_to calendars_url, notice: "今日出来たことが削除されました。"
    end
  end

    private

      def anger_record_params
        params.require(:anger_record).permit(:level, :got_angry_on, :got_angry_at, :place, :body, :changeable, :important)
      end

      def success_record_params
        params.require(:success_record).permit(:body)
      end
end
