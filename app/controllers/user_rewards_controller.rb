class UserRewardsController < ApplicationController
  def new
    @user_reward = UserReward.new
  end

  def create
    current_user.user_rewards.create(reward_id: params[:reward_id])
    redirect_to current_user, alert: "reward redeemed"
    point = current_user.points.where(redeemed?:false).first
    point.update_attribute(:redeemed?, true)
  end
end

private

def reward
  user_reward = UserReward.find_by(reward_id: params[:reward_id])
  Reward.find(user_reward.reward_id)
end
