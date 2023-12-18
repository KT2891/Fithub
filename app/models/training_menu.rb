class TrainingMenu < ApplicationRecord
  has_many :training_parts, dependent: :destroy
end
