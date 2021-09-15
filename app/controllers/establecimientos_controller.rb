class EstablecimientosController < ApplicationController
  before_action :set_establecimiento, only: %i[ show edit update destroy ]

  # GET /establecimientos or /establecimientos.json
  def index
    @establecimientos = Establecimiento.all
  end

  # GET /establecimientos/1 or /establecimientos/1.json
  def show
  end

  # GET /establecimientos/new
  def new
    @establecimiento = Establecimiento.new
  end

  # GET /establecimientos/1/edit
  def edit
  end

  # POST /establecimientos or /establecimientos.json
  def create
    @establecimiento = Establecimiento.new(establecimiento_params)

    respond_to do |format|
      if @establecimiento.save
        format.html { redirect_to @establecimiento, notice: "Establecimiento was successfully created." }
        format.json { render :show, status: :created, location: @establecimiento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @establecimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establecimientos/1 or /establecimientos/1.json
  def update
    respond_to do |format|
      if @establecimiento.update(establecimiento_params)
        format.html { redirect_to @establecimiento, notice: "Establecimiento was successfully updated." }
        format.json { render :show, status: :ok, location: @establecimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @establecimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establecimientos/1 or /establecimientos/1.json
  def destroy
    @establecimiento.destroy
    respond_to do |format|
      format.html { redirect_to establecimientos_url, notice: "Establecimiento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establecimiento
      @establecimiento = Establecimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def establecimiento_params
      params.require(:establecimiento).permit(:nombre, :ciudad, :rbd, :direccion, :telefono, :email, :director)
    end
end
