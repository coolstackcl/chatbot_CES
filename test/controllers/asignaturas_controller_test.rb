require "test_helper"

class AsignaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignatura = asignaturas(:one)
  end

  test "should get index" do
    get asignaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_asignatura_url
    assert_response :success
  end

  test "should create asignatura" do
    assert_difference('Asignatura.count') do
      post asignaturas_url, params: { asignatura: { nombre: @asignatura.nombre } }
    end

    assert_redirected_to asignatura_url(Asignatura.last)
  end

  test "should show asignatura" do
    get asignatura_url(@asignatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignatura_url(@asignatura)
    assert_response :success
  end

  test "should update asignatura" do
    patch asignatura_url(@asignatura), params: { asignatura: { nombre: @asignatura.nombre } }
    assert_redirected_to asignatura_url(@asignatura)
  end

  test "should destroy asignatura" do
    assert_difference('Asignatura.count', -1) do
      delete asignatura_url(@asignatura)
    end

    assert_redirected_to asignaturas_url
  end
end
