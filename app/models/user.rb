class User < ActiveRecord::Base
  has_many :lists
  validates :email, format: {with: /@/}, uniqueness: true
  validates :password, presence: true, confirmation: true

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
