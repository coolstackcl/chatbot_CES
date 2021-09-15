class ProfesorsController < ApplicationController
  before_action :set_profesor, only: %i[ show edit update destroy ]

  # GET /profesors or /profesors.json
  def index
    @profesors = Profesor.all
  end

  # GET /profesors/1 or /profesors/1.json
  def show
  end

  # GET /profesors/new
  def new
    @profesor = Profesor.new
  end

  # GET /profesors/1/edit
  def edit
  end

  # POST /profesors or /profesors.json
  def create
    @profesor = Profesor.new(profesor_params)

    respond_to do |format|
      if @profesor.save
        format.html { redirect_to @profesor, notice: "Profesor was successfully created." }
        format.json { render :show, status: :created, location: @profesor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesors/1 or /profesors/1.json
  def update
    respond_to do |format|
      if @profesor.update(profesor_params)
        format.html { redirect_to @profesor, notice: "Profesor was successfully updated." }
        format.json { render :show, status: :ok, location: @profesor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesors/1 or /profesors/1.json
  def destroy
    @profesor.destroy
    respond_to do |format|
      format.html { redirect_to profesors_url, notice: "Profesor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesor
      @profesor = Profesor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profesor_params
      params.require(:profesor).permit(:nombre, :apellido, :email, :inicioatencion, :finatencion)
    end
end
