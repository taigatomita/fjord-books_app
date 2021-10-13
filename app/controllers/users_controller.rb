# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]

  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to users_path, notice: t('controllers.common.notice_destroy', name: User.model_name.human)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :postal_code, :address, :self_introduction)
  end
end
