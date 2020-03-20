class User < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:google_id]

  validates :google_id, :email, presence: true

  private

  attr_readonly :google_id

  has_many :files

  protected

  def password_required?
    false
  end

  def encrypted_password; end
end
