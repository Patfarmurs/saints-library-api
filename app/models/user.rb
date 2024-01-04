class User < ApplicationRecord
  has_many :shelves, dependent: :destroy
  has_many :books, through: :reservations, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }
end
