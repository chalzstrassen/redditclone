class User < ActiveRecord::Base
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize :ensure_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_token
    self.session_token ||= User.generate_session_token
  end

  def reset_token
    session[:session_token] = nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
