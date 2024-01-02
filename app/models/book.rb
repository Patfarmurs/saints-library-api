class Book < ApplicationRecord
  has_many :shelves, dependent: :destroy
  has_many :users, through: :shelves, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true
end
