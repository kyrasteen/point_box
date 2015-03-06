require 'rails_helper'
# As a user
# When I login
# I see my dashboard
# with points and rewards

RSpec.describe "When registered user", type: :feature do

  it "cannot log in without username and pass" do
    visit login_path
    click_link_or_button('Sign in')
    expect(page).to have_content("Invalid login")
  end

  it "when logged in has link on dash to logout" do
    login_user
    expect(page).to have_content("Logout")
  end
end
