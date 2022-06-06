require "application_system_test_case"

class PartnersTest < ApplicationSystemTestCase
  setup do
    @partner = partners(:one)
  end

  test "visiting the index" do
    visit partners_url
    assert_selector "h1", text: "Partners"
  end

  test "should create partner" do
    visit partners_url
    click_on "New partner"

    fill_in "Address", with: @partner.address
    fill_in "Area", with: @partner.area
    fill_in "City", with: @partner.city
    fill_in "Description", with: @partner.description
    fill_in "Email", with: @partner.email
    fill_in "Fb", with: @partner.fb
    fill_in "Ig", with: @partner.ig
    fill_in "Liason mail", with: @partner.liason_mail
    fill_in "Liason name", with: @partner.liason_name
    fill_in "Liason phone", with: @partner.liason_phone
    fill_in "Logo url", with: @partner.logo_url
    fill_in "Name", with: @partner.name
    fill_in "Phone", with: @partner.phone
    fill_in "State", with: @partner.state
    fill_in "Web", with: @partner.web
    click_on "Create Partner"

    assert_text "Partner was successfully created"
    click_on "Back"
  end

  test "should update Partner" do
    visit partner_url(@partner)
    click_on "Edit this partner", match: :first

    fill_in "Address", with: @partner.address
    fill_in "Area", with: @partner.area
    fill_in "City", with: @partner.city
    fill_in "Description", with: @partner.description
    fill_in "Email", with: @partner.email
    fill_in "Fb", with: @partner.fb
    fill_in "Ig", with: @partner.ig
    fill_in "Liason mail", with: @partner.liason_mail
    fill_in "Liason name", with: @partner.liason_name
    fill_in "Liason phone", with: @partner.liason_phone
    fill_in "Logo url", with: @partner.logo_url
    fill_in "Name", with: @partner.name
    fill_in "Phone", with: @partner.phone
    fill_in "State", with: @partner.state
    fill_in "Web", with: @partner.web
    click_on "Update Partner"

    assert_text "Partner was successfully updated"
    click_on "Back"
  end

  test "should destroy Partner" do
    visit partner_url(@partner)
    click_on "Destroy this partner", match: :first

    assert_text "Partner was successfully destroyed"
  end
end
