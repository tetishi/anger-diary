# frozen_string_literal: true

class AngerRecordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_anger_record, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /anger_records/new
  def new
    @anger_record = AngerRecord.new
  end

  # POST /anger_records
  def create
    @anger_record = AngerRecord.new(anger_record_params)
    @anger_record.user = current_user

    if @anger_record.save
      redirect_to calendar_url(date: @anger_record.got_angry_on), notice: "怒りの記録が作成されました。"
    else
      render :new
    end
  end

  # PATCH/PUT /anger_records/1
  def update
    respond_to do |format|
      if @anger_record.update(anger_record_params)
        format.html { redirect_to calendar_url(date: @anger_record.got_angry_on) }
        format.json { render json: @anger_record }
      else
        format.html { render :edit }
        format.json { head :bad_request }
      end
    end
  end

  def destroy
    @anger_record.destroy
    render status: 200, actions: "destroy"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anger_record
      @anger_record = AngerRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anger_record_params
      params.require(:anger_record).permit(:level, :got_angry_on, :got_angry_at, :place, :anger_body, :changeable, :important)
    end
end
