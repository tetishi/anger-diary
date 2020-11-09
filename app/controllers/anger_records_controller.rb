# frozen_string_literal: true

class AngerRecordsController < ApplicationController
  before_action :set_anger_record, only: [:show, :edit, :update, :destroy]

  # GET /anger_records
  def index
    @anger_records = AngerRecord.all
  end

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

    respond_to do |format|
      if @anger_record.save
        format.html { redirect_to @anger_record, notice: "怒りの記録が作成されました。" }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /anger_records/1
  def update
    respond_to do |format|
      if @anger_record.update(anger_record_params)
        format.html { redirect_to @anger_record, notice: "怒りの記録が編集されました。" }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /anger_records/1
  def destroy
    @anger_record.destroy
    respond_to do |format|
      format.html { redirect_to anger_records_url, notice: "怒りの記録が削除されました。" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anger_record
      @anger_record = AngerRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anger_record_params
      params.require(:anger_record).permit(:level, :got_angry_on, :got_angry_at, :place, :body, :changeable, :important)
    end
end
