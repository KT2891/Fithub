class Public::TrainingDetailsController < ApplicationController
  before_action :set_current_user, only: %i[create]

  def new
    @training_detail = TrainingDetail.new
    @default_count = 3
  end

  def create
    # トレーニング詳細の基本パラメータセット
    @training_detail = @user.training_details.build(training_detail_params)
    # 1セット目のデータが入力されているか確認
    unless check_count_params_present?(params[:weights].first, params[:counts].first)
      render :new, alert: t("error-save-message")
      return
    end
    if @training_detail.save
      create_training_counts(get_count_param_length)
      create_or_find_training_set
      redirect_to training_sets_path, notice: t("success-save-message")
    else
      @default_count = 3
      render :new, alert: t("error-save-message")
    end
  end

  def destroy
    @training_detail = TrainingDetail.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  # トレーニング詳細に紐づくトレーニングセット作成
  def create_or_find_training_set
    # 日付が一致するトレーニングセットを検索
    @training_set = TrainingSet.find_by(user_id: @user.id, start_time: @training_detail.date.beginning_of_day)
    # 存在しない場合は新しいトレーニングセットを作成
    @training_set ||= TrainingSet.create(user_id: @user.id, start_time: @training_detail.date.beginning_of_day)
    # トレーニング詳細に紐づける
    @training_detail.update(training_set_id: @training_set.id)
  end

  # 重さか回数データがない場合はカウントを保存しない
  def check_count_params_present?(weight, count)
     weight.present? || count.present?
  end

  # 入力データからトレーニング詳細のセット数ごとのデータを作成
  def create_training_counts(length)
    length.times do |count|
      if check_count_params_present?(params[:weights][count], params[:counts][count])
        @training_detail.training_counts.create(
          weight: params[:weights][count].to_i,
          count: params[:counts][count].to_i,
          memo: params[:memos][count]
        )
      else
        return
      end
    end
  end

  # データの個数確認
  def get_count_param_length
    length = [
      params[:weights].length,
      params[:counts].length
      ].max
  end

  # ログインしているユーザを変数に格納
  def set_current_user
    @user = current_user
  end

  # ストロングパラーメータ設定
  def training_detail_params
    params.require(:training_detail).permit(:training_menu_id, :date)
  end
end
