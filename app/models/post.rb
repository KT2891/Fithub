class Post < ApplicationRecord
  belongs_to :user
  belongs_to :training_set
end
