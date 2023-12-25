class Admin::ReportsController < ApplicationController
  before_action :set_report, only: :update

  def index
    @reports = Report.order(created_at: :desc)
  end

  def update
    @report.update(report_params)
    redirect_to admin_reports_path, notice: "更新しました"
  end

  private
  def report_params
    params.require(:report).permit(:status)
  end

  def set_report
    @report = Report.find(params[:id])
  end
end
