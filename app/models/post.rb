class Post < ApplicationRecord
  belongs_to :user
  belongs_to :training_set, optional: true
  belongs_to :parent, class_name: 'Post', optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  has_many_attached :images

  scope :with_user_and_images, -> {
    includes(:images_attachments => :blob, user: { profile_image_attachment: :blob })
    .order(created_at: :desc)
  }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
