class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  def show
  end

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

  def destroy
    @reward.destroy
    redirect_to rewards_path
  end

end

private

def reward_params
  params.require(:reward).permit( :name, :cost)
end

def set_reward
  @reward = Reward.find(params[:id])
end
