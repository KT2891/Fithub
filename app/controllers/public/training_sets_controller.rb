class Public::TrainingSetsController < ApplicationController
  def index
    @training_sets = current_user.training_sets
    @training_set = TrainingSet.find_by(user_id: current_user.id, start_time: today_by_datetime)
  end

  def show
  end

  private
  def today_by_datetime
    DateTime.current.beginning_of_day
  end
end
