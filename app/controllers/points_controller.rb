class PointsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:user_id])
    user.points.create(redeemed?:false)
    redirect_to user_path(user), alert: "point successfully given"
  end
end
