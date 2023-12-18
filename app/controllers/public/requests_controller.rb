class Public::RequestsController < ApplicationController
  def create
    Request.create(request_params)
    redirect_to request.referer, notice: t("success-request")
  end

  private
  def request_params
    params.require(:request).permit(:user_id, :email, :title, :body)
  end
end
