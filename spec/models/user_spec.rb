require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username:'kyra', password:'s', role:0) }

  it "has valid attributes" do
    expect(user.username).to eq('kyra')
    expect(user.password).to eq('s')
    expect(user.role).to eq('default')
  end

  it "has many points" do
    3.times { user.points.create(redeemed?:true) }
    expect(user.points.count).to eq(3)
  end

  it "has many rewards" do
    3.times { user.rewards.create(name:'cake', cost:10) }
    expect(user.rewards.count).to eq(3)
  end

end
