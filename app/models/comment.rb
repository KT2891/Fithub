class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
    # 親コメントへの関連
  belongs_to :parent, class_name: 'Comment', optional: true

  # 子コメント（返信）への関連
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
end
