class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  enum status: { active: 0, quit: 1, block: 2 }

  validates :name, presence: true,
                   length: { maximum: 20}
  validates :sex, inclusion: { in: [0, 1, 2]}
  validates :introduction, length: { maximum: 150 }
  

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

  # 通知に関するアソシエーション
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # 通報に関するアソシエーション
  has_many :active_reports, class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :passive_reports, class_name: "Report", foreign_key: "reported_id", dependent: :destroy



  scope :with_posts, -> { includes(:post) }

  # 対象のユーザが引数のユーザをフォローしているかの確認
  def followed_by?(user)
    following.include?(user)
  end
  
  # 部分検索用
  def self.look(word)
    User.where("name LIKE?", "%#{word}%")
  end

  # フォローしているユーザーのポストを取得
  def following_posts
    Post.where(user_id: following_ids)
  end

  def guest?
    email != GUEST_USER_EMAIL
  end

  def password_must_contain_letter
    return if password.blank?
    unless password.match?(/[a-zA-Z]/)
      redirect_to new_user_registration_path, alert: t("error-password-valid")
    end
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
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

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end


end
