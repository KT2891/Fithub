class Request < ApplicationRecord
  enum status: { unread: 0, read: 1 }
  
  validates :email, presence: true, length: { minimum: 1}
  validates :title, presence: true, length: { minimum: 1}
  validates :body, presence: true, length: { minimum: 1}
  
end
