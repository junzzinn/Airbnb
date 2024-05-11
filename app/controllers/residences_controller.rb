class ResidencesController < ApplicationController
  before_action :set_residence, only: %i[ show edit update destroy ]

  # GET /residences or /residences.json
  def index
    @residences = Residence.all
  end

  # GET /residences/1 or /residences/1.json
  def show
  end

  # GET /residences/new
  def new
    @residence = Residence.new
  end

  # GET /residences/1/edit
  def edit
  end

  # POST /residences or /residences.json
  def create
    @residence = Residence.new(residence_params)

    respond_to do |format|
      if @residence.save
        format.html { redirect_to residence_url(@residence), notice: "Residence was successfully created." }
        format.json { render :show, status: :created, location: @residence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residences/1 or /residences/1.json
  def update
    respond_to do |format|
      if @residence.update(residence_params)
        format.html { redirect_to residence_url(@residence), notice: "Residence was successfully updated." }
        format.json { render :show, status: :ok, location: @residence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residences/1 or /residences/1.json
  def destroy
    @residence.destroy!

    respond_to do |format|
      format.html { redirect_to residences_url, notice: "Residence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residence
      @residence = Residence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def residence_params
      params.require(:residence).permit(:user_id, :title, :description, :image, :address, :price_per_night, :category)
    end
end
