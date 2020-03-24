class DriveFile < ApplicationRecord
  belongs_to :user

  scope :available, -> { where(is_deleted: false) }
  scope :deleted, -> { where(is_deleted: true) }
end
