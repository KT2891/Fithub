class BodyFat < ApplicationRecord
  belongs_to :user

  validates :body_fat, presence: true
end
