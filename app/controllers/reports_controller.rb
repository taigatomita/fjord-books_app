# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.where(user_id: params[:user_id])
  end

  def show
    @comments = @report.comments.all
  end

  def new
    @report = Report.new
    @user = User.find(params[:user_id])
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to user_reports_path, notice: '日報を保存しました。'
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to user_reports_path, notice: '日報を保存しました。'
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to user_reports_path, notice: '日報を削除しました。'
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
