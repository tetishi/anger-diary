# frozen_string_literal: true

class AngerRecordsController < ApplicationController
  before_action :set_anger_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

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
    @anger_record.user = current_user

    if @anger_record.save
      redirect_to @anger_record, notice: "怒りの記録が作成されました。"
    else
      render :new
    end
  end

  # PATCH/PUT /anger_records/1
  def update
    if @anger_record.update(anger_record_params)
      redirect_to calendars_path, notice: "怒りの記録が編集されました。"
    else
      render :edit
    end
  end

  def destroy
    # 以下の２行は必要じゃないかも？
    @anger_record.destroy
    # render status: 200, action: "destroy"

    binding.pry
    respond_to do |format|
      format.html
      format.json {render json: @anger_record.to_json}
    end
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
