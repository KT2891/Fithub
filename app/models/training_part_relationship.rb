class TrainingPartRelationship < ApplicationRecord
  belongs_to :training_part
  belongs_to :training_menu
end
