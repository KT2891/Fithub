class AddReplyToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :reply_id, :bigint
  end
end
