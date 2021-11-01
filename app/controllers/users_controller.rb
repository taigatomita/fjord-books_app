# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :postal_code, :address, :self_introduction)
  end
end
