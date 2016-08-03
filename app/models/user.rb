class User < ActiveRecord::Base
  has_many :lists
  validates :email, format: {with: /@/}, uniqueness: true
  validates :password_digest, length: { minimum: 6 ,message: "Password must be at least 6 characters long" }, , format: {with: /a-zA-Z0-9/}presence: true
  validates :password, confirmation: true

  def self.sign_up(args)
    User.create(args)
  end

  def password=(other)
    digest = BCrypt::Password.create(other)
    self.password_digest = digest
  end

  def password
    BCrypt::Password.new(self.password_digest)
  end
end
