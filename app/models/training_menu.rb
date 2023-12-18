class TrainingMenu < ApplicationRecord
  has_many :training_parts, dependent: :destroy
  accepts_nested_attributes_for :training_parts

  scope :with_training_part, -> { includes(:training_parts) }

  validates :name, presence: true, uniqueness: true
end
