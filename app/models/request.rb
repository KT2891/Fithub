class Request < ApplicationRecord
  enum status: { unread: 0, read: 1 }
end
