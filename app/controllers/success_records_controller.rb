# frozen_string_literal: true

class SuccessRecordsController < ApplicationController
  before_action :set_success_record, only: [:show, :edit, :update, :destroy]

  # GET /success_records
  def index
    @success_records = SuccessRecord.all
  end

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

    respond_to do |format|
      if @success_record.save
        format.html { redirect_to @success_record, notice: "今日出来たことが作成されました。" }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /success_records/1
  def update
    respond_to do |format|
      if @success_record.update(success_record_params)
        format.html { redirect_to @success_record, notice: "今日出来たことが編集されました。" }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /success_records/1
  def destroy
    @success_record.destroy
    respond_to do |format|
      format.html { redirect_to success_records_url, notice: "今日出来たことが削除されました。" }
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_success_record
        @success_record = SuccessRecord.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def success_record_params
        params.require(:success_record).permit()
      end
end
