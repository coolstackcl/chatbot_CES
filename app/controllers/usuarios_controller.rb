class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]

  # GET /usuarios or /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1 or /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @user = Usuario.find(session[:user_id])
    if helpers.admin_valid(@user)
      true
    else
      redirect_to '/usuarios/' + @user.id.to_s
    end

  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
    @user = Usuario.find(session[:user_id])
    if helpers.admin_valid(@user)
      true
    else
      redirect_to '/usuarios/' + @user.id.to_s
    end

  end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: "Usuario exitosamente creado." }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: "Usuario exitosamente modificado." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    nombre = @usuario.nombre + " " + @usuario.apellido
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "Usuario '#{nombre}' fue borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :apellido, :email, :password, :password_confirmation, :role_id)
    end

    def resp_text(text)
      respond_to do |format|
        format.html { redirect_to usuarios_url, notice: text }
        format.json { head :no_content }
      end
    end

end
