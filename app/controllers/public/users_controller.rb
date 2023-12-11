class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comment = Comment.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
  end

  def destroy
    user = current_user
    user.update(status: 1)
    redirect_to destroy_user_session_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :height)
  end

  def birth_day_params
    year = params[:date_year]
  end

  def to_date(year, month, day)
    if Date.valid_date?(year, month, day)
      date = Date.new(year, month, day)
      return date.strftime('%Y-%m-%d')
    else
      return "無効な日付"
    end
  end

end
