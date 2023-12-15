class Public::BodyCompositionsController < ApplicationController
  def index
    @weight = Weight.new
    @body_fat = BodyFat.new

    @weights_by_week = get_data(:weight)
    @body_fats_by_week = get_data(:body_fat)
    @week_by_night_and_morning = get_day_of_week_morning_and_night

  end

  def create
    create_or_update_data(:weight)
    create_or_update_data(:body_fat)
    redirect_to body_compositions_path, notice: t("success-save-message")
  end

  def edit
  end

  private

  def create_or_update_data(type)
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
    klass = (type == :weight) ? Weight : BodyFat
    klass.find_by(user_id: current_user.id, date: params[:weight][:date], day_or_night: period)
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

  def get_data_for_day_and_period(type, day, period)
    data = (type == :weight) ? Weight : BodyFat
    record = data.where(user_id: current_user.id, date: day, day_or_night: period).first
    record&.send(type) # weight or body_fat
  end

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
