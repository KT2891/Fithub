class TrainingPart < ApplicationRecord

  enum training_part: {
    shoulders: 1,
    arms: 2,
    chest: 3,
    back: 4,
    glutes: 5,
    legs_core: 6
  }

  belongs_to :training_menu

  validates :training_menu_id, presence: true
  validates :training_part, presence: true
end