require "application_system_test_case"

class ResidencesTest < ApplicationSystemTestCase
  setup do
    @residence = residences(:one)
  end

  test "visiting the index" do
    visit residences_url
    assert_selector "h1", text: "Residences"
  end

  test "should create residence" do
    visit residences_url
    click_on "New residence"

    fill_in "Address", with: @residence.address
    fill_in "Category", with: @residence.category
    fill_in "Description", with: @residence.description
    fill_in "Image", with: @residence.image
    fill_in "Price per night", with: @residence.price_per_night
    fill_in "Title", with: @residence.title
    fill_in "User", with: @residence.user_id
    click_on "Create Residence"

    assert_text "Residence was successfully created"
    click_on "Back"
  end

  test "should update Residence" do
    visit residence_url(@residence)
    click_on "Edit this residence", match: :first

    fill_in "Address", with: @residence.address
    fill_in "Category", with: @residence.category
    fill_in "Description", with: @residence.description
    fill_in "Image", with: @residence.image
    fill_in "Price per night", with: @residence.price_per_night
    fill_in "Title", with: @residence.title
    fill_in "User", with: @residence.user_id
    click_on "Update Residence"

    assert_text "Residence was successfully updated"
    click_on "Back"
  end

  test "should destroy Residence" do
    visit residence_url(@residence)
    click_on "Destroy this residence", match: :first

    assert_text "Residence was successfully destroyed"
  end
end
