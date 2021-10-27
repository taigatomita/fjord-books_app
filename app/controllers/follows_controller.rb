# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      redirect_to user, notice: 'ユーザーをフォローしました'
    else
      redirect_to user, notice: 'ユーザーのフォローに失敗しました'
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      redirect_to user, notice: 'ユーザーのフォローを解除しました'
    else
      redirect_to user, notice: 'ユーザーのフォロー解除に失敗しました'
    end
  end
end
