class Public::BodyCompositionsController < ApplicationController
  def index
    @weight = Weight.new
    @body_fat = BodyFat.new

    get_weights_data
  end

  def create
    create_or_update_weights
    create_or_update_body_fats
    redirect_to body_compositions_path, notice: "保存完了"
  end

  def edit
  end

  private

  def find_data(key, i)
    if key == "weight"
      data = Weight.find_by(user_id: current_user.id, date: params[:weight][:date], day_or_night: i)
    elsif key == "body_fat"
      data = BodyFat.find_by(user_id: current_user.id, date: params[:weight][:date], day_or_night: i)
    end
  end

  def create_or_update_weights()
    [0, 1].each do |i|
      weight = find_data("weight", i)
      if weight.present?
        weight.update(weight: params[:body][:weights][i])
      else
        current_user.weights.create(
          date: params[:weight][:date],
          day_or_night: i,
          weight: params[:body][:weights][i]
          )
      end
    end
  end

  def create_or_update_body_fats
    [0, 1].each do |i|
      body_fat = find_data("body_fat", i)
      if body_fat.present?
        body_fat.update(body_fat: params[:body][:fats][i])
      else
        current_user.body_fats.create(
          date: params[:weight][:date],
          day_or_night: i,
          body_fat: params[:body][:fats][i]
          )
      end
    end
  end

  def get_weights_data
    @line_chart_data = []
    base_days = [*Date.current - 1.week .. Date.current]
    base_days.each do |base_day|
      weight_data = Weight.where(user_id: current_user.id, date: base_day, day_or_night: 0)
      if weight_data.empty?
        weight = 0
      else
        weight = weight_data.first.weight
      end
      @line_chart_data << [base_day.strftime('%Y/%m/%d').to_s, weight]
    end
  end
end
