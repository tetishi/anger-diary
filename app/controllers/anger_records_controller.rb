class AngerRecordsController < ApplicationController
  before_action :set_anger_record, only: [:show, :edit, :update, :destroy]

  # GET /anger_records
  # GET /anger_records.json
  def index
    @anger_records = AngerRecord.all
  end

  # GET /anger_records/1
  # GET /anger_records/1.json
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
  # POST /anger_records.json
  def create
    @anger_record = AngerRecord.new(anger_record_params)

    respond_to do |format|
      if @anger_record.save
        format.html { redirect_to @anger_record, notice: 'Anger record was successfully created.' }
        format.json { render :show, status: :created, location: @anger_record }
      else
        format.html { render :new }
        format.json { render json: @anger_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anger_records/1
  # PATCH/PUT /anger_records/1.json
  def update
    respond_to do |format|
      if @anger_record.update(anger_record_params)
        format.html { redirect_to @anger_record, notice: 'Anger record was successfully updated.' }
        format.json { render :show, status: :ok, location: @anger_record }
      else
        format.html { render :edit }
        format.json { render json: @anger_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anger_records/1
  # DELETE /anger_records/1.json
  def destroy
    @anger_record.destroy
    respond_to do |format|
      format.html { redirect_to anger_records_url, notice: 'Anger record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anger_record
      @anger_record = AngerRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anger_record_params
      params.require(:anger_record).permit(:level, :place, :body)
    end
end
