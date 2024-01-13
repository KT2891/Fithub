class Public::BodyCompositionsController < ApplicationController
  def index
    @weight = Weight.new
    @body_fat = BodyFat.new
    # グラフ用データ取得
    @weights_by_week = get_data(:weight)
    @body_fats_by_week = get_data(:body_fat)
    @week_by_night_and_morning = get_day_of_week_morning_and_night
  end

  def create
    # 各データがすでにある場合は更新で、ない場合は作成
    create_or_update_data(:weight)
    create_or_update_data(:body_fat)
    redirect_to body_compositions_path, notice: t("success-save-message")
  end

  private

  def create_or_update_data(type)
    # データを朝と夜に対してそれぞれ作成もしくは更新
    [0, 1].each do |i|
      data = find_data(type, i)
      attributes = (type == :weight) ? { weight: params[:body][:weights][i] } : { body_fat: params[:body][:fats][i] }

      if data.present?
        data.update(attributes)
      else
        current_user.send(type.to_s.pluralize).create(attributes.merge(date: params[:weight][:date], day_or_night: i))
      end
    end
  end

  def find_data(type, period)
    class_data = (type == :weight) ? Weight : BodyFat
    class_data.find_by(user_id: current_user.id, date: params[:weight][:date], day_or_night: period)
  end

  def get_data(type)
    line_chart_data = []
    base_days = [*Date.current - 1.week .. Date.current]

    base_days.each do |base_day|
      [0, 1].each do |period|
        data = get_data_for_day_and_period(type, base_day, period)
        line_chart_data << (data || [line_chart_data.last, 0].max rescue 0)
      end
    end

    line_chart_data
  end
  # 
  def get_data_for_day_and_period(type, day, period)
    # typeの値から取得先のモデル指定
    data = (type == :weight) ? Weight : BodyFat
    # 各パラメータからデータを取得
    record = data.find_by(user_id: current_user.id, date: day, day_or_night: period)
    record&.send(type)
  end

  # グラフのX軸用のデータ作成
  # [MM/DD 朝, 夜, MM/DD 朝, 夜, ...]
  # 今日から1週間前までを取得
  # 機能拡張の際は選択した日からに変える
  def get_day_of_week_morning_and_night
    week_of_day = []
    days = [*Date.current - 1.week .. Date.current]
    days.each do |day|
      date_str = day.strftime('%m/%d')
      week_of_day << "#{date_str}朝"
      week_of_day << "夜"
    end
    week_of_day
  end

end
