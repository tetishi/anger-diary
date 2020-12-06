# frozen_string_literal: true

class SuccessRecordsController < ApplicationController
  before_action :set_success_record, only: [:show, :edit, :update, :destroy]

  # GET /success_records/1
  def show
  end

  # GET /success_records/new
  def new
    @success_record = SuccessRecord.new
  end

  # GET /success_records/1/edit
  def edit
  end

  # POST /success_records
  def create
    @success_record = SuccessRecord.new(success_record_params)
    @success_record.succeeded_on = Date.today.to_s
    # @success_record.succeeded_on = Date.today　でもいいかも

    if @success_record.save
      redirect_to @success_record, notice: "今日出来たことが作成されました。"
    else
      render :new
    end
  end

  # PATCH/PUT /success_records/1
  def update
    if @success_record.update(success_record_params)
      redirect_to calendar_url(date: @success_record.succeeded_on), notice: "今日出来たことが編集されました。"
    else
      render :edit
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_success_record
        @success_record = SuccessRecord.find(params[:id])
        # @success_record = SuccessRecord.find_by(succeeded_on: params[:date])
      end

      # Only allow a list of trusted parameters through.
      def success_record_params
        params.require(:success_record).permit(:success_body)
      end
end
