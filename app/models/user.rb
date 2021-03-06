class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}
  validates :phone_number, presence: true
  validates :email, presence: true

  has_secure_password validations: false

end
