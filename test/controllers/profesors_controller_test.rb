require "test_helper"

class ProfesorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor = profesors(:one)
  end

  test "should get index" do
    get profesors_url
    assert_response :success
  end

  test "should get new" do
    get new_profesor_url
    assert_response :success
  end

  test "should create profesor" do
    assert_difference('Profesor.count') do
      post profesors_url, params: { profesor: { apellido: @profesor.apellido, email: @profesor.email, finatencion: @profesor.finatencion, inicioatencion: @profesor.inicioatencion, nombre: @profesor.nombre } }
    end

    assert_redirected_to profesor_url(Profesor.last)
  end

  test "should show profesor" do
    get profesor_url(@profesor)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesor_url(@profesor)
    assert_response :success
  end

  test "should update profesor" do
    patch profesor_url(@profesor), params: { profesor: { apellido: @profesor.apellido, email: @profesor.email, finatencion: @profesor.finatencion, inicioatencion: @profesor.inicioatencion, nombre: @profesor.nombre } }
    assert_redirected_to profesor_url(@profesor)
  end

  test "should destroy profesor" do
    assert_difference('Profesor.count', -1) do
      delete profesor_url(@profesor)
    end

    assert_redirected_to profesors_url
  end
end
