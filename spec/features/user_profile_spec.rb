require 'rails_helper'
# As a user
# When I login
# I see my dashboard
# with points and rewards

RSpec.describe "When registered user", type: :feature do
  context "with valid attributes" do

    let(:sally) { User.create(username:'Sally', password:'Mae',role:0) }

    it "logs in to see dashboard" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sally)
      visit user_path(sally)
      within ('.header') do
        expect(page).to have_content("Sally's Dashboard")
      end
    end
  end
end
