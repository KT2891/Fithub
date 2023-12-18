module Admin::RequestsHelper
  def check_unread(request)
    if request.unread?
      "text-dark"
    else
      "text-black-50"
    end
  end
end
