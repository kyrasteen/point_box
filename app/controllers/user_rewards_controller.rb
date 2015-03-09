class UserRewardsController < ApplicationController
  def new
  end

  def create
    current_user.user_rewards.create(reward_id: params[:reward_id])
    point = current_user.points.where(redeemed?:false).first
    sufficient_points(point)
  end
end

private

def sufficient_points(point)
  if point
    point.update_attribute(:redeemed?, true)
    redirect_to current_user, alert: "reward redeemed"
  else
    redirect_to rewards_path, alert: "Insufficient points"
  end
end
