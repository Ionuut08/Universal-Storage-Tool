class DriveFile < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :name
  validates_presence_of :name

  scope :available, -> { where(is_deleted: false) }
  scope :deleted, -> { where(is_deleted: true) }

  MAX_BYTES = 24
end
