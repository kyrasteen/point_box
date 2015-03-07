require 'rails_helper'

RSpec.describe "As a default user", type: :feature do
  context "when I have adequate points" do
    let(:lucy) { User.create(username:'lucy', password:'rigg', role:0) }
    before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(lucy) }

    it "can redeem for a reward" do
      lucy.points.create(redeemed?:false)
      Reward.create(name:'muffin', cost:1)
      visit rewards_path
      click_link_or_button("get reward")
      click_link_or_button("Redeem")
      expect(page).to have_content("reward redeemed")
      expect(page).to have_content("muffin")
    end
  end
end
