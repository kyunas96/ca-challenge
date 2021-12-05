=begin
class User < ApplicationRecord
  require 'bcrypt'
  # db schema
  # t.string :username, null: false, unique: true
  # t.string :password_digest, null: false
  # t.string :session_token, null: false
  # t.boolean :is_admin, null :false
  # add_index :users, :session_token, unique: true

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  attr_reader :password

  after_initialize :ensure_session_token

  # define SPIRE methods here

  def self.find_by_credentials(username, password)
    user = User.find_by(username)

    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    test = BCrypt::Password.new(self.password_digest)
    test.is_password?(pw)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end

=end