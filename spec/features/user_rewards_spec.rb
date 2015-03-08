require 'rails_helper'

RSpec.describe "As a user", type: :feature do
  context "with admin role" do
    let(:admin) { User.create(username:"admin", password:"admin", role:1) }

    before do
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
       Reward.create(name:'cookie', cost:1)
       visit rewards_path
     end

    it "can add a new reward" do
      click_link_or_button("Add reward")
      fill_in("name", with: "cookie")
      fill_in("cost", with: "1")
      click_link_or_button("submit")
      expect(page).to have_content("cookie")
    end

    it "can edit a reward" do
      click_link_or_button("edit")
      fill_in("name", with: "pie")
      fill_in("cost", with:1)
      click_link_or_button("submit")
      expect(page).to have_content("pie")
      expect(page).not_to have_content("cookie")
    end

    it "can delete a reward" do
      click_link_or_button("delete")
      expect(page).not_to have_content('cookie')
    end
  end

  context "with defualt role" do
    let(:lucy) { User.create(username:"lucy", password:"rigg", role:0) }

    it "can only view index of rewards" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(lucy)
      Reward.create(name:'cookie', cost:1)
      visit rewards_path
      expect(page).to have_content("cookie")
      expect(page).not_to have_content("edit")
      expect(page).not_to have_content("delete")
      expect(page).not_to have_content("Add reward")
    end
  end

end
