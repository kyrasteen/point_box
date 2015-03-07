require 'rails_helper'

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

    it "cannot view another users' profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sally)
      protected_user = User.create(username: "protected",  password: "password", role:0)
      visit user_path(protected_user)
      within("#errors") do
        expect(page).to have_content("Not authorized")
      end
    end
  end

  context "As a defualt role" do
    it "cannot add points to my account" do
      login_user
      expect(page).not_to have_content('add point(s)')
    end

    it "cannot create possible rewards" do
      login_user
      expect(page).not_to have_content('add reward(s)')
    end
  end

  context "As a admin role" do
    it "sees all defualt users from a link on dashboard" do
      admin = User.create(username:'admin', password:'admin', role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit user_path(admin)
      expect(page).to have_link('All users')
    end
  end
end

  RSpec.describe "When unregistered user", type: :feature do
    let(:sally) { User.create(username:'Sally', password:'Mae',role:0) }
    it "cannot view a user's profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      visit user_path(sally)
      within("#errors") do
        expect(page).to have_content("Not authorized")
      end
  end
end
