class Weight < ApplicationRecord
  
  validates :weight, presence: true
  
  belongs_to :user

end
