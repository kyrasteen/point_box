class UserRewardsController < ApplicationController
  def new
    @user_reward = UserReward.new
  end

  def create
    current_user.user_rewards.create(reward_id: params[:reward_id])
    redirect_to current_user, alert: "reward redeemed"
  end
end
