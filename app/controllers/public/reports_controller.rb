class Public::ReportsController < ApplicationController
  before_action :set_post_and_user, only: :create
  def create
    @report = Report.new(report_params)
    @report.reporter_id = current_user.id
    @report.reported_id = @user.id
    @report.post_id = @post.id
    if @report.save #保存する
      redirect_to request.referer, notice: t("success-send-report")
    else
      redirect_to request.referer, alert: t("error-send-report")
    end
  end

  private
  def set_post_and_user
    @post = Post.find(params[:post_id])
    @user = @post.user
  end

  def report_params
    params.require(:report).permit(:reason)
  end
end
