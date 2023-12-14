class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :training_sets, dependent: :destroy
  has_many :training_details, dependent: :destroy
  has_many :weights, dependent: :destroy
  has_many :body_fats, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォロー関係のアソシエーション
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :with_posts, -> { includes(:post) }

  # 対象のユーザが引数のユーザをフォローしているかの確認
  def followed_by?(user)
    following.include?(user)
  end

  # ユーザにプロフィール画像が設定されていなければ"no-image.jpgを返す
  # リサイズ: method(height, width)の形式でサイズを指定
  def get_profile_image(height, width)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [height, width]).processed
  end

end
