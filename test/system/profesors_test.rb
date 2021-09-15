require "application_system_test_case"

class ProfesorsTest < ApplicationSystemTestCase
  setup do
    @profesor = profesors(:one)
  end

  test "visiting the index" do
    visit profesors_url
    assert_selector "h1", text: "Profesors"
  end

  test "creating a Profesor" do
    visit profesors_url
    click_on "New Profesor"

    fill_in "Apellido", with: @profesor.apellido
    fill_in "Email", with: @profesor.email
    fill_in "Finatencion", with: @profesor.finatencion
    fill_in "Inicioatencion", with: @profesor.inicioatencion
    fill_in "Nombre", with: @profesor.nombre
    click_on "Create Profesor"

    assert_text "Profesor was successfully created"
    click_on "Back"
  end

  test "updating a Profesor" do
    visit profesors_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @profesor.apellido
    fill_in "Email", with: @profesor.email
    fill_in "Finatencion", with: @profesor.finatencion
    fill_in "Inicioatencion", with: @profesor.inicioatencion
    fill_in "Nombre", with: @profesor.nombre
    click_on "Update Profesor"

    assert_text "Profesor was successfully updated"
    click_on "Back"
  end

  test "destroying a Profesor" do
    visit profesors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profesor was successfully destroyed"
  end
end
