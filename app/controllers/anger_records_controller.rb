# frozen_string_literal: true

class AngerRecordsController < ApplicationController
  before_action :set_anger_record, only: [:show, :edit, :update, :destroy]

  # GET /anger_records/1
  def show
  end

  # GET /anger_records/new
  def new
    @anger_record = AngerRecord.new
  end

  # GET /anger_records/1/edit
  def edit
  end

  # POST /anger_records
  def create
    @anger_record = AngerRecord.new(anger_record_params)

    if @anger_record.save
      redirect_to @anger_record, notice: "怒りの記録が作成されました。"
    else
      render :new
    end
  end

  # PATCH/PUT /anger_records/1
  def update
    if @anger_record.update(anger_record_params)
      redirect_to calendar_url(date: @anger_record.got_angry_on), notice: "怒りの記録が編集されました。"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anger_record
      @anger_record = AngerRecord.find(params[:id])
      # @anger_record = AngerRecord.find_by(got_angry_on: params[:date])
    end

    # Only allow a list of trusted parameters through.
    def anger_record_params
      params.require(:anger_record).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
    end
end
