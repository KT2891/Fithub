class TrainingDetail < ApplicationRecord
  belongs_to :user
  belongs_to :training_menu
  belongs_to :training_set
end
