class Post < ApplicationRecord
  belongs_to :user
  belongs_to :training_set, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :with_user_and_images, -> { includes(user: { profile_image_attachment: :blob })}
end
