class AsignaturasController < ApplicationController
  before_action :set_asignatura, only: %i[ show edit update destroy ]

  # GET /asignaturas or /asignaturas.json
  def index
    @asignaturas = Asignatura.all
  end

  # GET /asignaturas/1 or /asignaturas/1.json
  def show
  end

  # GET /asignaturas/new
  def new
    @asignatura = Asignatura.new
  end

  # GET /asignaturas/1/edit
  def edit
  end

  # POST /asignaturas or /asignaturas.json
  def create
    @asignatura = Asignatura.new(asignatura_params)

    respond_to do |format|
      if @asignatura.save
        format.html { redirect_to @asignatura, notice: "Asignatura was successfully created." }
        format.json { render :show, status: :created, location: @asignatura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asignatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignaturas/1 or /asignaturas/1.json
  def update
    respond_to do |format|
      if @asignatura.update(asignatura_params)
        format.html { redirect_to @asignatura, notice: "Asignatura was successfully updated." }
        format.json { render :show, status: :ok, location: @asignatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asignatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignaturas/1 or /asignaturas/1.json
  def destroy
    @asignatura.destroy
    respond_to do |format|
      format.html { redirect_to asignaturas_url, notice: "Asignatura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura
      @asignatura = Asignatura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asignatura_params
      params.require(:asignatura).permit(:nombre)
    end
end
