class BodyFat < ApplicationRecord
  
  validates :body_fat, presence: true
  
  belongs_to :user

end
