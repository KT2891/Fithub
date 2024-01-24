class Comment < ApplicationRecord
  
  validates :user_id, presence: true
  validates :body, presence: true,
                   length: { maximum: 100 }
  
  belongs_to :user
  belongs_to :post, optional: true
    # 親コメントへの関連
  belongs_to :parent, class_name: 'Comment', optional: true

  # 子コメント（返信）への関連
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
  # 通知に関するリレーション
  has_many :comment_notifications, class_name: "Notification", foreign_key: "comment_id", dependent: :destroy
  has_many :reply_notifications, class_name: "Notification", foreign_key: "reply_id", dependent: :destroy

  def create_notification_reply!(current_user, reply_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(parent_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_reply!(current_user, reply_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_reply!(current_user, reply_id, user_id) if temp_ids.blank?
  end

  def save_notification_reply!(current_user, reply_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      comment_id: id,
      reply_id: reply_id,
      visited_id: visited_id,
      action: 'reply'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
