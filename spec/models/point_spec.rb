require 'rails_helper'

RSpec.describe Point, type: :model do
  let(:point) { Point.create(user_id:1, redeemed?:false) }

  it "has valid attributes" do
    expect(point.user_id).to eq(1)
    expect(point.redeemed?).to eq(false)
  end

  # it "is associated with a user" do
  #   user = User.create(username:'kyra', password:'q')
  #   point = user.points.create(redeemed?:false)
  #   expect(point.user.id).to eq(1)
  # end

end
