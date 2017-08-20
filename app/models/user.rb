class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 25 }

end
