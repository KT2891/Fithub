class Admin::RequestsController < ApplicationController
  before_action :set_request, only: :update

  def index
    @requests = Request.order(created_at: :desc)
  end

  def update
    @request.update(request_params)
    redirect_to admin_requests_path, notice: "更新しました"
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
