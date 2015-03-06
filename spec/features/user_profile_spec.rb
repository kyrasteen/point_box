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
      within ('header') do
        expect(page).to have_content("Sally's Dashboard")
      end
    end

    it "sees their rewards and points" do
      sally.points.create(redeemed?:false)
      sally.rewards.create(name:'cake',cost:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sally)
      visit user_path(sally)
      expect(page).to have_content('cake')
      expect(page).to have_content(1)
    end
  end
end
