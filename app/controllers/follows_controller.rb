# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:followee_id])
    if current_user.follow(user)
      redirect_to user, notice: 'ユーザーをフォローしました'
    else
      redirect_to user, alert: 'ユーザーのフォローに失敗しました'
    end
  end

  def destroy
    user = User.find(params[:followee_id])
    if current_user.unfollow(user)
      redirect_to user, notice: 'ユーザーのフォローを解除しました'
    else
      redirect_to user, alert: 'ユーザーのフォロー解除に失敗しました'
    end
  end
end
