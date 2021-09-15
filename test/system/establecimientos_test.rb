require "application_system_test_case"

class EstablecimientosTest < ApplicationSystemTestCase
  setup do
    @establecimiento = establecimientos(:one)
  end

  test "visiting the index" do
    visit establecimientos_url
    assert_selector "h1", text: "Establecimientos"
  end

  test "creating a Establecimiento" do
    visit establecimientos_url
    click_on "New Establecimiento"

    fill_in "Ciudad", with: @establecimiento.ciudad
    fill_in "Direccion", with: @establecimiento.direccion
    fill_in "Director", with: @establecimiento.director
    fill_in "Email", with: @establecimiento.email
    fill_in "Nombre", with: @establecimiento.nombre
    fill_in "Rbd", with: @establecimiento.rbd
    fill_in "Telefono", with: @establecimiento.telefono
    click_on "Create Establecimiento"

    assert_text "Establecimiento was successfully created"
    click_on "Back"
  end

  test "updating a Establecimiento" do
    visit establecimientos_url
    click_on "Edit", match: :first

    fill_in "Ciudad", with: @establecimiento.ciudad
    fill_in "Direccion", with: @establecimiento.direccion
    fill_in "Director", with: @establecimiento.director
    fill_in "Email", with: @establecimiento.email
    fill_in "Nombre", with: @establecimiento.nombre
    fill_in "Rbd", with: @establecimiento.rbd
    fill_in "Telefono", with: @establecimiento.telefono
    click_on "Update Establecimiento"

    assert_text "Establecimiento was successfully updated"
    click_on "Back"
  end

  test "destroying a Establecimiento" do
    visit establecimientos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Establecimiento was successfully destroyed"
  end
end
