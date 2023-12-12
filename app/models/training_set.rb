class TrainingSet < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  has_many :training_details, dependent: :destroy
end
