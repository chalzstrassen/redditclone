class User < ActiveRecord::Base
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize {  }


end
