require 'rails_helper'

RSpec.describe "As admin role", type: :feature do
  let(:admin) { User.create(username:"admin", password:"admin", role:1) }

  it "can add a new reward to possible rewards" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit rewards_path
    click_link_or_button("Add reward")
    fill_in("name", with: "cookie")
    fill_in("cost", with: "1")
    click_link_or_button("submit")
    expect(page).to have_content("cookie")
  end

  it "can edit a reward" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    Reward.create(name:'cookie', cost:1)
    visit rewards_path
    click_link_or_button("edit")
    fill_in("name", with: "pie")
    fill_in("cost", with:1)
    click_link_or_button("submit")
    save_and_open_page
    expect(page).to have_content("pie")
    expect(page).not_to have_content("cookie")
  end

end
