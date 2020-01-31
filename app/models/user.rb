# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :gen_token
  has_many :posts
  before_create :create_token_and_save
  before_save { email.downcase! }

  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypted(string)
    Digest::SHA1.hexdigest(string.to_s)
  end

  def create_token_and_save
    self.gen_token = User.new_token
    self.remember_digest = User.encrypted(gen_token)
  end
end
