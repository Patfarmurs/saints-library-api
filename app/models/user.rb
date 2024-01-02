class User < ApplicationRecord
  has_secure_password

  has_many :shelves, dependent: :destroy
  has_many :books, through: :shelves, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true, length: { in: 6..25 }
end
