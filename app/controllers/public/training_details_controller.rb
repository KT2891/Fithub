class Public::TrainingDetailsController < ApplicationController
  before_action :set_current_user, only: %i[create]

  def new
    @training_detail = TrainingDetail.new
    @default_count = 3
  end

  def create
    # トレーニング詳細の基本パラメータセット
    @training_detail = @user.training_details.build(
      training_menu_id: training_detail_params,
      date: params_by_date
    )

    if @training_detail.save
      create_training_counts(params[:training_detail][:count].to_i)
      @training_set
      create_or_find_training_set
      redirect_to training_sets_path, notice: t("success-save-message")
    else
      @default_count = 3
      render :new, alert: t("error-save-message")
    end
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

  # 入力データからトレーニン詳細のセット数ごとのデータを作成
  def create_training_counts(counts)
    counts.times do |count|
      @training_detail.training_counts.create(
        weight: params[:training_detail][:"weight_#{count}"],
        count: params[:training_detail][:"count_#{count}"],
        memo: params[:training_detail][:"memo_#{count}"]
      )
    end
  end

  def set_current_user
    # ログインしているユーザを変数に格納
    @user = current_user
  end

  def training_detail_params
    params[:training_detail][:training_menu_id]
  end

  def params_by_date
    Date.current
  end
end
