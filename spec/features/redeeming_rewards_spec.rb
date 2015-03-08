require 'rails_helper'

RSpec.describe "As a default user", type: :feature do
  context "when I have adequate points" do
    let(:lucy) { User.create(username:'lucy', password:'rigg', role:0) }
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(lucy)
      lucy.points.create(redeemed?:false)
    end

    it "can redeem for a reward" do
      Reward.create(name:'muffin', cost:1)
      visit rewards_path
      click_link_or_button("get reward")
      click_link_or_button("Redeem")
      expect(page).to have_content("reward redeemed")
      expect(page).to have_content("muffin")
    end

    it "redeemed points are marked redeemed" do
      reward = Reward.create(name:'chocolate', cost:1)
      visit reward_path(reward)
      click_link_or_button("Redeem")
      within("#points") do
        expect(page).to have_content('redeemed')
      end
    end
  end
end
