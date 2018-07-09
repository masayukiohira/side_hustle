class FollowsController < ApplicationController
before_action :authenticate_user! && :status_user

  def create
  	user = User.find(params[:user_id])

  	if user.inverse_follows.create(follower: current_user)
      flash[:success] = "フォローしました"
      redirect_to user_path(current_user)
  	else
      flash[:danger] = "フォローできません"
      redirect_to user_path(current_user)
  	end
  end

  def destroy
  	user = User.find(params[:user_id])
  	follow = user.inverse_follows.find_by(follower: current_user.id)
  	follow.destroy
  	flash[:success] = "フォローを解除しました"
    redirect_to user_path(current_user)
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end
