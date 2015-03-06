require 'rails_helper'

RSpec.describe Reward, type: :model do
  let(:reward) { Reward.create(name:'cake', cost:10) }

  it "has valid attributes" do
    expect(reward.name).to eq('cake')
    expect(reward.cost).to eq(10)
  end

  it "has many users" do
    3.times { reward.users.create(username:'kyra', password:'q') }
    expect(reward.users.count).to eq(3)
  end
  
end
