class User < ActiveRecord::Base
  attr_reader :password
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validate :password, length: { minimum: 6 }
  after_initialize :ensure_session_token

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end
end
