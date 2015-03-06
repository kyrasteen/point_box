require 'rails_helper'

RSpec.describe UserReward, type: :model do
  let(:user_reward) { UserReward.create(user_id:1, reward_id:3) }

  it "has valid attributes" do
    expect(user_reward.user_id).to eq(1)
    expect(user_reward.reward_id).to eq(3)
  end

end
