class Post < ApplicationRecord
  belongs_to :user
  belongs_to :training_set, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  scope :with_user_and_images, -> { includes(user: { profile_image_attachment: :blob })}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
