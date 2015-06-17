require 'spec_helper'

feature "User views the index page" do
  scenario "user sees the correct title" do
    visit '/index'

    expect(page).to have_content "Meet ups in Space"
  end

  scenario "user sees a list of groups to join" do
    visit '/index'

    expect(page).to have_content "Fight the Man"
  end
end
