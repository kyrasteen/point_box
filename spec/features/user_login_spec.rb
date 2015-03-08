require 'rails_helper'

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

  it "Logs out and redirects to sign in" do
    login_user
    click_link_or_button("Logout")
    expect(page).to have_button('Sign in')
  end

end
