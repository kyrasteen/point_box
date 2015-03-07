require 'rails_helper'

def setup
  Capybara.reset!
end

RSpec.describe "As an admin", type: :feature do
  let(:admin) { User.create(username:'admin', password:'admin', role:1) }
  let(:sally) { User.create(username:'Sally', password:'mae', role:0) }

  it "can give point(s) to a default user " do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit user_path(admin)
    click_link_or_button("All users")
    visit user_path(sally)
    expect(page).to have_content("+1 point for Sally")
  end

  it "an added point is shown on a defualt user's dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit user_path(sally)
    click_link_or_button('+1 point for Sally')
    expect(sally.points.count).to eq(1)
    expect(page).to have_content("point successfully given")
    expect(page).to have_content(1)
  end

  xit "can remove point(s) for a given user" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit user_path(sally)
    click_link_or_button('+1 point for Sally')
    click_link_or_button('-1 point for Sally')
    expect(sally.points.count).to eq(0)
    expect(page).not_to have_content(1)
  end
end
