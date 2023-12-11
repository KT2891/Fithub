class Public::TrainingSetsController < ApplicationController
  def index
    @training_sets = current_user.training_sets
    @training_set = TrainingSet.find_by(user_id: current_user.id, start_time: DateTime.today)
  end

  def show
  end

  private
  def to_day

  end
end
