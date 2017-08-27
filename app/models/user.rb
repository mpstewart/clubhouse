class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 25 }

  private
    def generate_remember_token
      self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    end
end