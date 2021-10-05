class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post, optional: true
  belongs_to :comment, optional: true

  # --------------------通知----------------------
  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :visited, class_name: 'User', optional: true
  # --------------------通知----------------------
end
