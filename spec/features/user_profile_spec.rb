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

    it "unregistered user cannot view a user's profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      visit user_path(sally)
      within("#errors") do
        expect(page).to have_content("Not authorized")
      end
  end
end

# test "registered user cannot view another users' profile" do
#   ApplicationController.any_instance.stubs(:current_user).returns(user)
#   protected_user = User.create(username: "protected",  password: "password", password_confirmation: "password")
#   visit user_path(protected_user)
#   within("#flash_alert") do
#     assert page.has_content?("You are not authorized to access this page")
#   end
# end

end
