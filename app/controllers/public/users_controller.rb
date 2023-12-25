class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_current_user, only: %i[edit update leave]

  def show
    @posts = @user.posts
    @comment = Comment.new
  end

  def edit
    if !@user.guest?
      redirect_to user_path(@user), alert: "ゲストユーザーはプロフィール編集を行えません。"
    end
  end

  def update
    # 誕生日が存在している場合に更新
    update_birthday
    if @user.update(user_params)
      redirect_to user_path(@user), notice: t("success-update-message")
    else
      redirect_to edit_user_path, alert: t("error-update-message")
    end
  end

  # 退会確認用フォーム
  def confirm
  end

  def leave
    current_user.update(status: 1)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :height)
  end

  def set_current_user
    # ログインしているユーザを変数に格納
    @user = current_user
  end

  def set_user
    # IDでユーザを検索
    @user = User.find(params[:id])
  end

  def update_birthday
    return unless birthday_present?
    birthday_info = to_date(params[:user][:birth_year].to_i, params[:user][:birth_month].to_i, params[:user][:birth_day].to_i)
    case birthday_info[:key]
    when :success
      @user.birthday = birthday_info[:date]
    when :error
      redirect_to edit_user_path, alert: birthday_info[:text]
      return
    end
  end

  def birthday_present?
    # 生年月日のフィールドが存在するか確認
    params[:user][:birth_year].present? && params[:user][:birth_month].present? && params[:user][:birth_day].present?
  end

  def to_date(year, month, day)
    if Date.valid_date?(year, month, day)
      date = Date.new(year, month, day)
      { key: :success, date: date.strftime('%Y-%m-%d') }
    else
      { key: :error, text: t("error-birthday") }
    end
  end
end