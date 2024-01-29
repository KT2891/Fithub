class Public::RequestsController < ApplicationController
  before_action :authenticate_user!, except: :create
  
  def create
    request = Request.new(request_params)
    if request.save
      redirect_to request.referer, notice: t("success-request")
    else
      redirect_to root_path, alert: t("error-request")
    end
  end

  private
  # ストロングパラメータ設定
  def request_params
    params.require(:request).permit(:user_id, :email, :title, :body)
  end
end
