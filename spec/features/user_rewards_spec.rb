require 'rails_helper'

RSpec.describe "As admin role", type: :feature do
  let(:admin) { User.create(username:"admin", password:"admin", role:1) }

  it "can add a new reward to possible rewards" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit rewards_path
    click_link_or_button("Add reward")
    fill_in("name", with: "cookie")
    fill_in("cost", with: "1")
    click_link_or_button("Add")
    expect(page).to have_content("cookie")
  end

end
