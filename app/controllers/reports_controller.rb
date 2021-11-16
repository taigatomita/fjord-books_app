# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :check_user, only: %i[edit update destroy]

  def index
    @reports = Report.all.order(:id)
  end

  def show
    @comments = @report.comments.all.order(:id)
  end

  def new
    @report = Report.new
    @user = User.find(current_user.id)
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to reports_path, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to reports_path, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy!
    redirect_to reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def check_user
    return if current_user == @report.user

    redirect_to reports_path
  end
end
