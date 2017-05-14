class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password

  has_many :votes
  has_many :suggested_songs
  has_many :authorizations
  has_many :playlists, through: :authorizations

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, :uniqueness => {:case_sensitive => false}
  validates :password, length: {in: 6..20}, confirmation: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
