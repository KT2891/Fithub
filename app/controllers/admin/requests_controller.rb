class Admin::RequestsController < ApplicationController
  before_action :set_request, only: :update

  def index
    @requests = Request.all
  end

  def update
    @requset.update(request_params)
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
