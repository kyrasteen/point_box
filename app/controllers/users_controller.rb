class UsersController < ApplicationController
  before_filter :authorize

  def index
    @users = User.where(role:0)
  end

  def show
    @user = User.find(params[:id])
    @points = @user.points
    @total_points = @user.points.where(redeemed?:false).count
    @rewards = @user.rewards
    authorize! :read, @user
  end

  def create
  end

  private

  def authorize
    if current_user.nil? #|| User.find(params[:id]).id != current_user.id
      redirect_to login_path, alert: "Not authorized"
      #as redirect you do not have to specify flash[], just pass message as second parameter
    end
  end

end
