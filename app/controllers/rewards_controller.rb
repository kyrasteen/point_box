class RewardsController < ApplicationController
  before_action :set_reward, only: [:edit, :update, :destroy]

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to rewards_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reward.update(reward_params)
      redirect_to rewards_path
    else
      render :new
    end
  end

end

private

def reward_params
  params.require(:reward).permit( :name, :cost)
end

def set_reward
  @reward = Reward.find(params[:id])
end
