class Book < ApplicationRecord
  has_many :shelves, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true
  validates :body, presence: true
end
