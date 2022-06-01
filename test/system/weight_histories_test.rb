require "application_system_test_case"

class WeightHistoriesTest < ApplicationSystemTestCase
  setup do
    @weight_history = weight_histories(:one)
  end

  test "visiting the index" do
    visit weight_histories_url
    assert_selector "h1", text: "Weight Histories"
  end

  test "creating a Weight history" do
    visit weight_histories_url
    click_on "New Weight History"

    fill_in "Start time", with: @weight_history.start_time
    fill_in "User", with: @weight_history.user_id
    fill_in "Weight", with: @weight_history.weight
    click_on "Create Weight history"

    assert_text "Weight history was successfully created"
    click_on "Back"
  end

  test "updating a Weight history" do
    visit weight_histories_url
    click_on "Edit", match: :first

    fill_in "Start time", with: @weight_history.start_time
    fill_in "User", with: @weight_history.user_id
    fill_in "Weight", with: @weight_history.weight
    click_on "Update Weight history"

    assert_text "Weight history was successfully updated"
    click_on "Back"
  end

  test "destroying a Weight history" do
    visit weight_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weight history was successfully destroyed"
  end
end
