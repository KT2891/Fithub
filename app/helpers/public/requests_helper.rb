module Public::RequestsHelper
  # ログインしている場合お問い合わせフォームに
  # デフォルトでメールアドレスを記入
  def request_user_email
    user_signed_in? ? current_user.email : ""
  end
end
