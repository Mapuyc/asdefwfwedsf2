require 'rails_helper'

RSpec.feature "user logs in", type: :feature do
  scenario "using facebook oauth2" do
    visit root_path
    expect(page).to have_link("Sign in with Facebook")
    click_link "Sign in with Facebook"
    expect(page).to have_content("Successfully authenticated from Facebook account.")
    expect(page).to have_link("Log out")
  end
end
